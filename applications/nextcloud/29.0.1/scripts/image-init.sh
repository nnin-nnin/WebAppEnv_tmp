#!/usr/bin/env bash
set -Eeuo pipefail

MYSQL_SOCKET=/run/mysqld/mysqld.sock
MYSQL_PIDFILE=/run/mysqld/mysqld.pid

mkdir -p /var/www/html/data /run/mysqld /var/lib/mysql
chown -R www-data:www-data /var/www/html
chown -R mysql:mysql /run/mysqld /var/lib/mysql
mariadb-install-db --user=mysql --datadir=/var/lib/mysql --skip-test-db >/dev/null

mariadbd --user=mysql --datadir=/var/lib/mysql --bind-address=127.0.0.1 --port=3306 \
    --socket="$MYSQL_SOCKET" --pid-file="$MYSQL_PIDFILE" &
db_pid=$!
cleanup() {
    if kill -0 "$db_pid" 2>/dev/null; then
        mariadb-admin --socket="$MYSQL_SOCKET" -uroot shutdown >/dev/null 2>&1 || kill "$db_pid" 2>/dev/null || true
    fi
    wait "$db_pid" 2>/dev/null || true
}
trap cleanup EXIT

for attempt in $(seq 1 60); do
    if mariadb-admin --socket="$MYSQL_SOCKET" ping >/dev/null 2>&1; then break; fi
    sleep 1
    if [[ "$attempt" == 60 ]]; then echo 'MariaDB build initialization timed out' >&2; exit 1; fi
done

mariadb --socket="$MYSQL_SOCKET" -uroot -e "CREATE DATABASE nextcloud CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci; CREATE USER 'nextcloud'@'127.0.0.1' IDENTIFIED BY '${NEXTCLOUD_DB_PASSWORD}'; GRANT ALL PRIVILEGES ON nextcloud.* TO 'nextcloud'@'127.0.0.1'; FLUSH PRIVILEGES;"
chown -R www-data:www-data /var/www/html/config /var/www/html/data
admin_password=$(cat /run/secrets/admin_password)
runuser -u www-data -- env NC_DB_PASS="$NEXTCLOUD_DB_PASSWORD" NC_ADMIN_PASS="$admin_password" php /var/www/html/occ maintenance:install --database=mysql --database-name=nextcloud --database-host=127.0.0.1 --database-port=3306 --database-user=nextcloud --database-pass="$NEXTCLOUD_DB_PASSWORD" --admin-user=admin --admin-pass="$admin_password" --data-dir=/var/www/html/data --no-interaction
runuser -u www-data -- php /var/www/html/occ config:system:set trusted_domains 1 --value=127.0.0.1
runuser -u www-data -- php /var/www/html/occ config:system:set trusted_domains 2 --value=localhost

cleanup
trap - EXIT
rm -f "$MYSQL_PIDFILE" /var/lib/mysql/*.pid /var/lib/mysql/*.sock
mkdir -p /opt/nextcloud
cp -a /var/lib/mysql /opt/nextcloud/mysql-seed
chown -R mysql:mysql /opt/nextcloud/mysql-seed
