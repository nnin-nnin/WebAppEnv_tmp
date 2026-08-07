#!/usr/bin/env bash
set -Eeuo pipefail

mysql_data_dir=/var/lib/mysql
mysql_socket=/run/mysqld/mysqld.sock
mysql_pid_file=/run/mysqld/mysqld.pid
database_seed=/usr/local/share/espocrm/espocrmdb.sql
db_pid=""
app_pid=""

cleanup() {
  local status=$?

  if [[ -n "$app_pid" ]] && kill -0 "$app_pid" 2>/dev/null; then
    kill "$app_pid" 2>/dev/null || true
  fi
  if [[ -n "$db_pid" ]] && kill -0 "$db_pid" 2>/dev/null; then
    mariadb-admin --socket="$mysql_socket" -u root shutdown 2>/dev/null || kill "$db_pid" 2>/dev/null || true
  fi
  wait 2>/dev/null || true
  exit "$status"
}

trap cleanup EXIT INT TERM

install -d -o mysql -g mysql /run/mysqld
chown -R mysql:mysql "$mysql_data_dir"

if [[ ! -d "$mysql_data_dir/mysql" ]]; then
  mariadb-install-db --user=mysql --datadir="$mysql_data_dir" --skip-test-db >/dev/null
fi

mariadbd \
  --user=mysql \
  --datadir="$mysql_data_dir" \
  --socket="$mysql_socket" \
  --pid-file="$mysql_pid_file" \
  --bind-address=127.0.0.1 \
  --skip-name-resolve \
  &
db_pid=$!

for _ in {1..60}; do
  if mariadb-admin --socket="$mysql_socket" -u root ping >/dev/null 2>&1; then
    break
  fi
  if ! kill -0 "$db_pid" 2>/dev/null; then
    echo "MariaDB exited during startup" >&2
    exit 1
  fi
  sleep 1
done

if ! mariadb-admin --socket="$mysql_socket" -u root ping >/dev/null 2>&1; then
  echo "MariaDB did not become ready" >&2
  exit 1
fi

mariadb --socket="$mysql_socket" -u root <<'SQL'
CREATE DATABASE IF NOT EXISTS `espocrmdb`;
CREATE USER IF NOT EXISTS 'dbadmin'@'localhost' IDENTIFIED BY 'benchmark-only';
CREATE USER IF NOT EXISTS 'dbadmin'@'127.0.0.1' IDENTIFIED BY 'benchmark-only';
ALTER USER 'dbadmin'@'localhost' IDENTIFIED BY 'benchmark-only';
ALTER USER 'dbadmin'@'127.0.0.1' IDENTIFIED BY 'benchmark-only';
GRANT ALL PRIVILEGES ON `espocrmdb`.* TO 'dbadmin'@'localhost';
GRANT ALL PRIVILEGES ON `espocrmdb`.* TO 'dbadmin'@'127.0.0.1';
FLUSH PRIVILEGES;
SQL

table_count="$(mariadb --socket="$mysql_socket" -u root -Nse \
  "SELECT COUNT(*) FROM information_schema.tables WHERE table_schema='espocrmdb' AND table_name='user';")"
if [[ "$table_count" != "1" ]]; then
  mariadb --socket="$mysql_socket" -u root < "$database_seed"
fi

apache2-foreground &
app_pid=$!

set +e
wait -n "$db_pid" "$app_pid"
status=$?
set -e
exit "$status"
