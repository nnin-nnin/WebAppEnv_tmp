#!/bin/bash
set -Eeuo pipefail
DATA_DIR=/var/lib/mysql
APP_DIR=/var/www/html
DB_NAME="${ESPOCRM_DB_NAME:-espocrm}"
DB_USER="${ESPOCRM_DB_USER:-espocrm}"
DB_PASSWORD="${ESPOCRM_DB_PASSWORD:-espocrm-internal}"
mkdir -p "$DATA_DIR" "$APP_DIR/data" "$APP_DIR/custom" /run/mysqld
chown -R mysql:mysql "$DATA_DIR" /run/mysqld
chown -R www-data:www-data "$APP_DIR/data" "$APP_DIR/custom"
if [ ! -d "$DATA_DIR/mysql" ]; then mariadb-install-db --user=mysql --datadir="$DATA_DIR" --skip-test-db >/dev/null; fi
mysqld --user=mysql --datadir="$DATA_DIR" --skip-networking=0 --bind-address=127.0.0.1 --socket=/run/mysqld/mysqld.sock --pid-file=/run/mysqld/mysqld.pid &
DB_PID=$!
trap 'kill "$DB_PID" 2>/dev/null || true; apachectl -k stop 2>/dev/null || true; wait "$DB_PID" 2>/dev/null || true' TERM INT EXIT
for _ in $(seq 1 60); do
  if mariadb-admin --protocol=socket --socket=/run/mysqld/mysqld.sock ping >/dev/null 2>&1; then break; fi
  if ! kill -0 "$DB_PID" 2>/dev/null; then echo 'MariaDB exited during startup' >&2; exit 1; fi
  sleep 1
done
mariadb-admin --protocol=socket --socket=/run/mysqld/mysqld.sock ping >/dev/null 2>&1 || { echo 'MariaDB did not become ready' >&2; exit 1; }
mariadb --protocol=socket --socket=/run/mysqld/mysqld.sock -uroot <<SQL
CREATE DATABASE IF NOT EXISTS \`$DB_NAME\` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER IF NOT EXISTS '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASSWORD';
CREATE USER IF NOT EXISTS '$DB_USER'@'127.0.0.1' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON \`$DB_NAME\`.* TO '$DB_USER'@'localhost';
GRANT ALL PRIVILEGES ON \`$DB_NAME\`.* TO '$DB_USER'@'127.0.0.1';
FLUSH PRIVILEGES;
SQL
if [ ! -f "$APP_DIR/data/config.php" ]; then
  php install/cli.php -a saveSettings -d "db-name=$DB_NAME&host-name=127.0.0.1&db-user-name=$DB_USER&db-user-password=$DB_PASSWORD&db-platform=Mysql&site-url=http%3A%2F%2Flocalhost"
  php install/cli.php -a buildDatabase
  php install/cli.php -a savePreferences -d 'user-name=admin&user-pass=benchmark-only&dateFormat=DD.MM.YYYY&timeFormat=HH:mm&timeZone=UTC&weekStart=0&defaultCurrency=USD&thousandSeparator=%2C&decimalMark=.'
  php install/cli.php -a createUser -d 'user-name=admin&user-pass=benchmark-only'
  php install/cli.php -a finish
fi
chown -R www-data:www-data "$APP_DIR/data" "$APP_DIR/custom"
apachectl -DFOREGROUND &
APACHE_PID=$!
wait -n "$DB_PID" "$APACHE_PID"
exit $?
