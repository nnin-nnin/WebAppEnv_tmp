#!/usr/bin/env bash
set -Eeuo pipefail

app_root=/var/www/html
db_dir=/var/lib/mysql
socket=/run/mysqld/mysqld.sock
db_name=limesurvey
db_user=limesurvey
db_password=limesurvey-db-local
install_marker="$db_dir/.limesurvey-installed"

mkdir -p /run/mysqld "$db_dir" "$app_root/application/runtime" "$app_root/upload" \
    "$app_root/upload/surveys" "$app_root/tmp"
chown -R mysql:mysql /run/mysqld "$db_dir"
chown -R www-data:www-data "$app_root/application/runtime" "$app_root/upload" "$app_root/tmp"

if [[ ! -d "$db_dir/mysql" ]]; then
    mariadb-install-db --user=mysql --datadir="$db_dir" >/var/log/mariadb-install.log 2>&1
fi

mariadbd --user=mysql --datadir="$db_dir" --bind-address=127.0.0.1 \
    --socket="$socket" --pid-file=/run/mysqld/mysqld.pid --skip-name-resolve \
    --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci \
    --max_allowed_packet=64M &
mysql_pid=$!

apache_pid=''
shutdown() {
    if [[ -n "$apache_pid" ]]; then
        apachectl -k stop >/dev/null 2>&1 || true
    fi
    mariadb-admin --protocol=socket --socket="$socket" -uroot shutdown >/dev/null 2>&1 || true
    wait "$mysql_pid" 2>/dev/null || true
    if [[ -n "$apache_pid" ]]; then
        wait "$apache_pid" 2>/dev/null || true
    fi
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

if [[ ! -f "$install_marker" ]]; then
    bootstrap_password="$(od -An -N24 -tx1 /dev/urandom | tr -d ' \n')"
    if ! (cd "$app_root" && php application/commands/console.php install admin "$bootstrap_password" 'LimeSurvey Administrator' admin@example.invalid) \
        >/var/log/limesurvey-install.log 2>&1; then
        echo 'LimeSurvey 数据库初始化失败；请检查容器日志' >&2
        exit 1
    fi
    touch "$install_marker"
fi

admin_hash="$(tr -d '\r\n' < /usr/local/share/limesurvey-admin-password.hash)"
if [[ ! "$admin_hash" =~ ^\$2[ayb]\$[0-9]{2}\$ ]]; then
    echo '管理员凭据校验哈希缺失或格式无效' >&2
    exit 1
fi

mariadb --protocol=socket --socket="$socket" -uroot limesurvey \
    --execute="UPDATE lime_users SET users_name='admin', password='$admin_hash', email='admin@example.invalid' WHERE uid=1;"
chown -R www-data:www-data "$app_root/application/config" "$app_root/application/runtime" "$app_root/upload" "$app_root/tmp"

apachectl -DFOREGROUND &
apache_pid=$!
trap shutdown TERM INT

while kill -0 "$mysql_pid" 2>/dev/null && kill -0 "$apache_pid" 2>/dev/null; do
    sleep 1
done

if ! kill -0 "$mysql_pid" 2>/dev/null; then
    echo 'MariaDB unexpectedly exited' >&2
    exit 1
fi
echo 'Apache unexpectedly exited' >&2
exit 1
