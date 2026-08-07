#!/usr/bin/env bash
set -Eeuo pipefail

app_root=/var/www/html
db_dir=/var/lib/mysql
socket=/run/mysqld/mysqld.sock
db_name="${LEANTIME_DB_NAME:-leantime}"
db_user="${LEANTIME_DB_USER:-leantime}"
db_password="${LEANTIME_DB_PASSWORD:-leantime-db-local}"
admin_hash_file=/usr/local/share/leantime-admin-password.hash

mkdir -p /run/mysqld "$db_dir" "$app_root/config" "$app_root/cache" \
    "$app_root/logs" "$app_root/userfiles" "$app_root/backupdb" /var/log/apache2
chown -R mysql:mysql /run/mysqld "$db_dir"
chown -R www-data:www-data "$app_root/config" "$app_root/cache" "$app_root/logs" \
    "$app_root/userfiles" "$app_root/backupdb"

if [[ ! -d "$db_dir/mysql" ]]; then
    mariadb-install-db --user=mysql --datadir="$db_dir" --skip-test-db \
        >/var/log/mariadb-install.log 2>&1
fi

if [[ ! -f "$app_root/config/.env" ]]; then
    umask 077
    cat >"$app_root/config/.env" <<EOF
LEAN_APP_URL = ''
LEAN_APP_DIR = ''
LEAN_DEBUG = 0
LEAN_ENV = production
LEAN_DB_HOST = 127.0.0.1
LEAN_DB_USER = ${db_user}
LEAN_DB_PASSWORD = ${db_password}
LEAN_DB_DATABASE = ${db_name}
LEAN_DB_PORT = 3306
LEAN_SITENAME = Leantime
LEAN_LANGUAGE = en-US
LEAN_DEFAULT_TIMEZONE = UTC
LEAN_SESSION_PASSWORD = leantime-local-session-secret-3.1.4
LEAN_SESSION_EXPIRATION = 28800
LEAN_EMAIL_RETURN = admin@localhost
LEAN_EMAIL_USE_SMTP = false
LEAN_USE_S3 = false
LEAN_OIDC_ENABLE = false
LEAN_USE_REDIS = false
EOF
    chown www-data:www-data "$app_root/config/.env"
fi

mariadbd --user=mysql --datadir="$db_dir" --bind-address=127.0.0.1 \
    --socket="$socket" --pid-file=/run/mysqld/mysqld.pid --skip-name-resolve \
    --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci \
    --max_allowed_packet=64M &
db_pid=$!

shutdown() {
    apachectl -k stop >/dev/null 2>&1 || true
    mariadb-admin --protocol=socket --socket="$socket" -uroot shutdown >/dev/null 2>&1 || true
    wait "$db_pid" 2>/dev/null || true
}
trap shutdown TERM INT

ready=0
for _ in {1..120}; do
    if mariadb-admin --protocol=socket --socket="$socket" -uroot ping >/dev/null 2>&1; then
        ready=1
        break
    fi
    if ! kill -0 "$db_pid" 2>/dev/null; then
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
CREATE DATABASE IF NOT EXISTS \`$db_name\` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER IF NOT EXISTS '$db_user'@'127.0.0.1' IDENTIFIED BY '$db_password';
ALTER USER '$db_user'@'127.0.0.1' IDENTIFIED BY '$db_password';
GRANT ALL PRIVILEGES ON \`$db_name\`.* TO '$db_user'@'127.0.0.1';
FLUSH PRIVILEGES;
SQL

installed="$(mariadb --protocol=socket --socket="$socket" -uroot \
    -N -B -e "SELECT COUNT(*) FROM information_schema.tables WHERE table_schema='$db_name' AND table_name='zp_user';")"
if [[ "$installed" == "0" ]]; then
    cd "$app_root"
    php bin/leantime db:migrate --silent=true
fi

if [[ ! -s "$admin_hash_file" ]]; then
    echo '管理员凭据哈希缺失' >&2
    exit 1
fi
admin_hash="$(tr -d '\r\n' <"$admin_hash_file")"
if [[ ! "$admin_hash" =~ ^\$2[ayb]\$[0-9]{2}\$ ]]; then
    echo '管理员凭据哈希格式无效' >&2
    exit 1
fi

admin_count="$(mariadb --protocol=socket --socket="$socket" -uroot "$db_name" \
    -N -B -e "SELECT COUNT(*) FROM zp_user WHERE username='admin';")"
if [[ "$admin_count" == "0" ]]; then
    mariadb --protocol=socket --socket="$socket" -uroot "$db_name" <<SQL
INSERT INTO zp_user
    (username,password,firstname,lastname,phone,status,role,clientId,notifications,createdOn,modified)
VALUES ('admin','$admin_hash','System','Administrator','', 'a', '50', 1, 1, NOW(), NOW());
SQL
fi

chown -R www-data:www-data "$app_root/config" "$app_root/cache" "$app_root/logs" \
    "$app_root/userfiles" "$app_root/backupdb"
apachectl -DFOREGROUND &
apache_pid=$!
trap 'shutdown; kill "$apache_pid" 2>/dev/null || true' TERM INT

while kill -0 "$db_pid" 2>/dev/null && kill -0 "$apache_pid" 2>/dev/null; do
    sleep 1
done

if ! kill -0 "$db_pid" 2>/dev/null; then
    echo 'MariaDB 异常退出' >&2
    exit 1
fi
echo 'Apache 异常退出' >&2
exit 1
