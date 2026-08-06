#!/bin/bash
set -Eeuo pipefail
db_pid=''
apache_pid=''
cleanup() {
    if [ -n "$apache_pid" ]; then kill "$apache_pid" 2>/dev/null || true; fi
    if [ -n "$db_pid" ]; then kill "$db_pid" 2>/dev/null || true; wait "$db_pid" 2>/dev/null || true; fi
}
trap cleanup TERM INT EXIT
mkdir -p /run/mysqld /var/log/mysql /var/lib/fluxbb
chown -R mysql:mysql /run/mysqld /var/lib/mysql /var/log/mysql
chown -R www-data:www-data /var/lib/fluxbb
if [ ! -d /var/lib/mysql/mysql ]; then
    mysql_install_db --user=mysql --datadir=/var/lib/mysql --skip-test-db >/dev/null
fi
mysqld --user=mysql --datadir=/var/lib/mysql --bind-address=127.0.0.1 --skip-name-resolve --socket=/run/mysqld/mysqld.sock --pid-file=/run/mysqld/mysqld.pid >/var/log/mysql/mysqld.log 2>&1 &
db_pid=$!
ready=0
for _ in $(seq 1 120); do
    if mysqladmin --protocol=socket --socket=/run/mysqld/mysqld.sock -uroot ping >/dev/null 2>&1; then ready=1; break; fi
    if ! kill -0 "$db_pid" 2>/dev/null; then cat /var/log/mysql/mysqld.log >&2; exit 1; fi
    sleep 1
done
if [ "$ready" -ne 1 ]; then cat /var/log/mysql/mysqld.log >&2; exit 1; fi
mysql --protocol=socket --socket=/run/mysqld/mysqld.sock -uroot <<'SQL'
CREATE DATABASE IF NOT EXISTS fluxbb CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER IF NOT EXISTS 'fluxbb'@'127.0.0.1' IDENTIFIED BY 'benchmark-db-only';
GRANT ALL PRIVILEGES ON fluxbb.* TO 'fluxbb'@'127.0.0.1';
FLUSH PRIVILEGES;
SQL
if ! mysql --protocol=socket --socket=/run/mysqld/mysqld.sock -uroot -N -e "SHOW TABLES FROM fluxbb LIKE 'fluxbb_users'" | grep -q fluxbb_users; then
    FLUXBB_BASE_URL="${FLUXBB_BASE_URL:-http://localhost:18311}" php /opt/fluxbb-scripts/initialize.php >/var/log/fluxbb-install.log 2>&1
fi
if [ ! -f /var/lib/fluxbb/config.php ]; then
    FLUXBB_BASE_URL="${FLUXBB_BASE_URL:-http://localhost:18311}" php /opt/fluxbb-scripts/write-config.php
fi
touch /var/lib/fluxbb/initialized
apache2-foreground &
apache_pid=$!
while kill -0 "$apache_pid" 2>/dev/null; do
    if ! kill -0 "$db_pid" 2>/dev/null; then cat /var/log/mysql/mysqld.log >&2; exit 1; fi
    sleep 1
done
exit 1
