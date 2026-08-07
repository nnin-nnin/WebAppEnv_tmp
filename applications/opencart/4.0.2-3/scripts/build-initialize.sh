#!/usr/bin/env bash
set -Eeuo pipefail

data_dir="/var/lib/mysql"
socket="/run/mysqld/mysqld.sock"
pid_file="/run/mysqld/mysqld.pid"
log_file="/var/log/mysql/opencart-build.log"

install -d -o mysql -g mysql /run/mysqld /var/log/mysql
rm -rf "${data_dir:?}"/*
mariadb-install-db --user=mysql --datadir="$data_dir" --skip-test-db >/dev/null

mysqld --user=mysql --datadir="$data_dir" --bind-address=127.0.0.1 --socket="$socket" --pid-file="$pid_file" --log-error="$log_file" &
db_pid=$!
cleanup() {
    kill "$db_pid" 2>/dev/null || true
    wait "$db_pid" 2>/dev/null || true
}
trap cleanup EXIT

for attempt in $(seq 1 60); do
    if mariadb-admin --protocol=socket --socket="$socket" ping >/dev/null 2>&1; then
        break
    fi
    if ! kill -0 "$db_pid" 2>/dev/null; then
        sed -n '1,120p' "$log_file" >&2 || true
        exit 1
    fi
    sleep 1
done
mariadb-admin --protocol=socket --socket="$socket" ping >/dev/null

mariadb --protocol=socket --socket="$socket" <<'SQL'
CREATE DATABASE opencart CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
CREATE USER 'opencart'@'localhost' IDENTIFIED BY 'opencart';
GRANT ALL PRIVILEGES ON opencart.* TO 'opencart'@'localhost';
CREATE USER 'opencart'@'127.0.0.1' IDENTIFIED BY 'opencart';
GRANT ALL PRIVILEGES ON opencart.* TO 'opencart'@'127.0.0.1';
FLUSH PRIVILEGES;
SQL

cp /var/www/html/config-dist.php /var/www/html/config.php
cp /var/www/html/admin/config-dist.php /var/www/html/admin/config.php
chmod 0666 /var/www/html/config.php /var/www/html/admin/config.php

if [ ! -r /run/secrets/opencart_admin_password ]; then
    echo 'missing build secret: opencart_admin_password' >&2
    exit 1
fi
admin_password="$(< /run/secrets/opencart_admin_password)"
if [ -z "$admin_password" ]; then
    echo 'empty build secret: opencart_admin_password' >&2
    exit 1
fi

if ! php /var/www/html/install/cli_install.php install \
    --username admin \
    --email admin@example.com \
    --password "$admin_password" \
    --http_server http://localhost:18523/ \
    --db_driver mysqli \
    --db_hostname 127.0.0.1 \
    --db_username opencart \
    --db_password opencart \
    --db_database opencart \
    --db_port 3306 \
    --db_prefix oc_ >/tmp/opencart-install.log; then
    sed -n '1,240p' /tmp/opencart-install.log >&2 || true
    exit 1
fi

if ! grep -q 'SUCCESS! OpenCart successfully installed' /tmp/opencart-install.log; then
    sed -n '1,240p' /tmp/opencart-install.log >&2 || true
    exit 1
fi
rm -f /tmp/opencart-install.log
chown -R www-data:www-data /var/www/html/system/storage /var/www/html/image
