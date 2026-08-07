#!/usr/bin/env bash
set -Eeuo pipefail

db_dir=/var/lib/mysql
socket=/run/mysqld/mysqld.sock
db_name="${GLPI_DB_NAME:-glpi}"
db_user="${GLPI_DB_USER:-glpi}"
db_password="${GLPI_DB_PASSWORD:-glpi-db-local}"
app_root=/var/www/html
config_file="$app_root/config/config_db.php"

mkdir -p /run/mysqld "$db_dir" "$app_root/config" \
    "$app_root/files"/{_cache,_cron,_dumps,_graphs,_locales,_lock,_log,_pictures,_plugins,_rss,_sessions,_tmp,_uploads,_inventories}
chown -R mysql:mysql /run/mysqld "$db_dir"
chown -R www-data:www-data "$app_root/config" "$app_root/files"

if [[ ! -d "$db_dir/mysql" ]]; then
    mariadb-install-db --user=mysql --datadir="$db_dir" >/var/log/mariadb-install.log 2>&1
fi

mariadbd --user=mysql --datadir="$db_dir" --bind-address=127.0.0.1 \
    --socket="$socket" --pid-file=/run/mysqld/mysqld.pid --skip-name-resolve \
    --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci \
    --max_allowed_packet=64M &
mysql_pid=$!

shutdown() {
    apachectl -k stop >/dev/null 2>&1 || true
    mariadb-admin --protocol=socket --socket="$socket" -uroot shutdown >/dev/null 2>&1 || true
    wait "$mysql_pid" 2>/dev/null || true
}
trap shutdown TERM INT

ready=0
for _ in {1..120}; do
    if mariadb-admin --protocol=socket --socket="$socket" -uroot ping >/dev/null 2>&1; then
        ready=1
        break
    fi
    if ! kill -0 "$mysql_pid" 2>/dev/null; then
        echo 'MariaDB 在启动期间退出' >&2
        exit 1
    fi
    sleep 1
done
if [[ "$ready" != 1 ]]; then
    echo 'MariaDB 未在限定时间内就绪' >&2
    exit 1
fi

mariadb --protocol=socket --socket="$socket" -uroot <<SQL
CREATE DATABASE IF NOT EXISTS \`${db_name}\` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER IF NOT EXISTS '${db_user}'@'127.0.0.1' IDENTIFIED BY '${db_password}';
ALTER USER '${db_user}'@'127.0.0.1' IDENTIFIED BY '${db_password}';
GRANT ALL PRIVILEGES ON \`${db_name}\`.* TO '${db_user}'@'127.0.0.1';
FLUSH PRIVILEGES;
SQL

if [[ ! -f "$config_file" ]]; then
    cd "$app_root"
    php bin/console database:install --no-interaction --default-language=en_GB \
        --db-host=127.0.0.1 --db-name="$db_name" --db-user="$db_user" \
        --db-password="$db_password"
fi

admin_hash="$(tr -d '\r\n' < /usr/local/share/glpi-admin-password.hash)"
if [[ ! "$admin_hash" =~ ^\$2[ayb]\$[0-9]{2}\$ ]]; then
    echo '管理员凭据哈希缺失或格式无效' >&2
    exit 1
fi

mariadb --protocol=socket --socket="$socket" -uroot "$db_name" <<SQL
UPDATE glpi_users
SET name='admin', password='${admin_hash}', is_active=1, authtype=1
WHERE id=2;
UPDATE glpi_configs SET value='http://localhost' WHERE context='core' AND name='url_base';
UPDATE glpi_configs SET value='http://localhost/api' WHERE context='core' AND name='url_base_api';
UPDATE glpi_configs SET value='1' WHERE context='core' AND name='enable_api';
UPDATE glpi_configs SET value='1' WHERE context='core' AND name='enable_api_login_credentials';
UPDATE glpi_apiclients SET ipv4_range_start=0, ipv4_range_end=4294967295, ipv6=NULL WHERE id=1;
SQL

chown -R www-data:www-data "$app_root/config" "$app_root/files"
apachectl -DFOREGROUND &
apache_pid=$!
trap 'shutdown; kill "$apache_pid" 2>/dev/null || true' TERM INT

while kill -0 "$mysql_pid" 2>/dev/null && kill -0 "$apache_pid" 2>/dev/null; do
    sleep 1
done

if ! kill -0 "$mysql_pid" 2>/dev/null; then
    echo 'MariaDB unexpectedly exited' >&2
    exit 1
fi
echo 'Apache unexpectedly exited' >&2
exit 1
