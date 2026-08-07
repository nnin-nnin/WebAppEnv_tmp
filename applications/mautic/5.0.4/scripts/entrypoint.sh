#!/usr/bin/env bash
set -euo pipefail

data_dir=/var/lib/mysql
seed_dir=/opt/mautic-db-seed
socket=/run/mysqld/mysqld.sock
apache_pid=0
mkdir -p /run/mysqld "$data_dir" /var/www/html/var/cache /var/www/html/var/logs /var/www/html/media/files
chown -R mysql:mysql /run/mysqld "$data_dir"
chown -R www-data:www-data /var/www/html/var /var/www/html/media /var/www/html/app/config

if [ ! -d "$data_dir/mysql" ]; then
  if [ -d "$seed_dir/mysql" ]; then
    cp -a "$seed_dir"/. "$data_dir"/
    chown -R mysql:mysql "$data_dir"
  else
    mariadb-install-db --user=mysql --datadir="$data_dir" >/dev/null
  fi
fi

mysqld --user=mysql --datadir="$data_dir" --bind-address=127.0.0.1 --socket="$socket" --port=3306 &
db_pid=$!
cleanup() {
  if [ "$apache_pid" -gt 0 ]; then kill "$apache_pid" 2>/dev/null || true; fi
  kill "$db_pid" 2>/dev/null || true
  if [ "$apache_pid" -gt 0 ]; then wait "$apache_pid" 2>/dev/null || true; fi
  wait "$db_pid" 2>/dev/null || true
}
trap cleanup TERM INT

for _ in $(seq 1 60); do
  if mariadb-admin --socket="$socket" --user=root ping >/dev/null 2>&1; then
    break
  fi
  if ! kill -0 "$db_pid" 2>/dev/null; then
    echo "MariaDB exited during startup" >&2
    exit 1
  fi
  sleep 1
done

if ! mariadb-admin --socket="$socket" --user=root ping >/dev/null 2>&1; then
  echo "MariaDB did not become ready" >&2
  exit 1
fi

apache2-foreground &
apache_pid=$!

while kill -0 "$db_pid" 2>/dev/null && kill -0 "$apache_pid" 2>/dev/null; do
  sleep 2
done

if ! kill -0 "$db_pid" 2>/dev/null; then
  echo "MariaDB exited unexpectedly" >&2
else
  echo "Apache exited unexpectedly" >&2
fi
exit 1
