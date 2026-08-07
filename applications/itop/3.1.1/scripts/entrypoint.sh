#!/bin/bash
set -Eeuo pipefail

DB_DIR=/var/lib/mysql
SOCKET=/run/mysqld/mysqld.sock
mkdir -p "$DB_DIR" /run/mysqld /var/www/html/data /var/www/html/log
chown -R mysql:mysql "$DB_DIR" /run/mysqld
chown -R www-data:www-data /var/www/html/data /var/www/html/log

if [ ! -d "$DB_DIR/mysql" ]; then
  mariadb-install-db --user=mysql --datadir="$DB_DIR" --skip-test-db >/dev/null
fi

mysqld --user=mysql --datadir="$DB_DIR" --skip-networking=0 --bind-address=127.0.0.1 --socket="$SOCKET" --pid-file=/run/mysqld/mysqld.pid &
DB_PID=$!
APACHE_PID=
cleanup() {
  set +e
  if [ -n "${APACHE_PID:-}" ]; then
    kill "$APACHE_PID" >/dev/null 2>&1 || true
    apachectl -k stop >/dev/null 2>&1 || true
    wait "$APACHE_PID" >/dev/null 2>&1 || true
  fi
  kill "$DB_PID" >/dev/null 2>&1 || true
  wait "$DB_PID" >/dev/null 2>&1 || true
}
trap cleanup TERM INT EXIT

for attempt in $(seq 1 90); do
  if mariadb-admin --protocol=socket --socket="$SOCKET" ping >/dev/null 2>&1; then break; fi
  if ! kill -0 "$DB_PID" >/dev/null 2>&1; then echo 'MariaDB 在启动阶段退出' >&2; exit 1; fi
  sleep 1
done
mariadb-admin --protocol=socket --socket="$SOCKET" ping >/dev/null 2>&1 || { echo 'MariaDB 未在限定时间内就绪' >&2; exit 1; }

mariadb --protocol=socket --socket="$SOCKET" -uroot <<'SQL'
CREATE DATABASE IF NOT EXISTS `itop` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER IF NOT EXISTS 'itop'@'localhost' IDENTIFIED BY 'itop-internal-db';
CREATE USER IF NOT EXISTS 'itop'@'127.0.0.1' IDENTIFIED BY 'itop-internal-db';
ALTER USER 'itop'@'localhost' IDENTIFIED BY 'itop-internal-db';
ALTER USER 'itop'@'127.0.0.1' IDENTIFIED BY 'itop-internal-db';
GRANT ALL PRIVILEGES ON `itop`.* TO 'itop'@'localhost';
GRANT ALL PRIVILEGES ON `itop`.* TO 'itop'@'127.0.0.1';
FLUSH PRIVILEGES;
SQL

mariadb --protocol=socket --socket="$SOCKET" -uitop -pitop-internal-db itop <<'SQL'
INSERT INTO priv_urp_userprofile (userid, profileid, description)
SELECT u.id, p.id, 'All-in-one REST registration support'
FROM priv_user AS u
JOIN priv_urp_profiles AS p ON p.name = 'REST Services User'
WHERE u.login = 'admin'
  AND NOT EXISTS (
    SELECT 1 FROM priv_urp_userprofile AS existing
    WHERE existing.userid = u.id AND existing.profileid = p.id
  );
SQL

apachectl -DFOREGROUND &
APACHE_PID=$!
wait -n "$DB_PID" "$APACHE_PID"
exit $?
