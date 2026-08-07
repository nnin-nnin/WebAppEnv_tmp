#!/usr/bin/env bash
set -Eeuo pipefail

db_pid=""
apache_pid=""
socket_path="/run/mysqld/mysqld.sock"
data_dir="/var/lib/mysql"
db_name="${APP_DB_NAME:-oscommerce}"
db_user="${APP_DB_USER:-oscommerce}"
db_password="${APP_DB_PASSWORD:-oscommerce-internal}"

cleanup() {
  local status=$?
  trap - EXIT TERM INT
  if [[ -n "$apache_pid" ]] && kill -0 "$apache_pid" 2>/dev/null; then
    kill -TERM "$apache_pid" 2>/dev/null || true
    wait "$apache_pid" 2>/dev/null || true
  fi
  if [[ -n "$db_pid" ]] && kill -0 "$db_pid" 2>/dev/null; then
    kill -TERM "$db_pid" 2>/dev/null || true
    wait "$db_pid" 2>/dev/null || true
  fi
  exit "$status"
}
trap cleanup EXIT TERM INT

mkdir -p /run/mysqld /var/lib/oscommerce /var/log/mysql \
  /var/www/html/includes/OSC/Work/Cache \
  /var/www/html/includes/OSC/Work/Logs \
  /var/www/html/includes/OSC/Work/Session
chown mysql:mysql /run/mysqld /var/lib/mysql /var/lib/oscommerce /var/log/mysql
chown -R www-data:www-data /var/www/html/includes/OSC/Work

if [[ ! -d "$data_dir/mysql" ]]; then
  mariadb-install-db --user=mysql --datadir="$data_dir" --skip-test-db >/dev/null
fi

mysqld --user=mysql --datadir="$data_dir" --socket="$socket_path" --pid-file=/run/mysqld/mysqld.pid \
  --bind-address=127.0.0.1 --port=3306 --skip-name-resolve --log-error=/var/log/mysql/error.log &
db_pid=$!

ready=0
for _ in $(seq 1 60); do
  if mariadb-admin --protocol=socket --socket="$socket_path" -uroot ping >/dev/null 2>&1; then
    ready=1
    break
  fi
  if ! kill -0 "$db_pid" 2>/dev/null; then
    echo "MariaDB exited before becoming ready" >&2
    exit 1
  fi
  sleep 1
done
if [[ "$ready" != 1 ]]; then
  echo "MariaDB did not become ready within 60 seconds" >&2
  exit 1
fi

mariadb --protocol=socket --socket="$socket_path" -uroot <<SQL
CREATE DATABASE IF NOT EXISTS $db_name CHARACTER SET utf8 COLLATE utf8_unicode_ci;
CREATE USER IF NOT EXISTS '$db_user'@'127.0.0.1' IDENTIFIED BY '$db_password';
CREATE USER IF NOT EXISTS '$db_user'@'localhost' IDENTIFIED BY '$db_password';
GRANT ALL PRIVILEGES ON $db_name.* TO '$db_user'@'127.0.0.1';
GRANT ALL PRIVILEGES ON $db_name.* TO '$db_user'@'localhost';
FLUSH PRIVILEGES;
SQL

php /opt/oscommerce/initialize.php
rm -rf /var/www/html/install

apache2-foreground &
apache_pid=$!
wait -n "$db_pid" "$apache_pid"
status=$?
echo "osCommerce core process exited with status $status" >&2
exit "$status"
