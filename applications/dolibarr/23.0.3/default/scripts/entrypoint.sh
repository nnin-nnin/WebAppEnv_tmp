#!/usr/bin/env bash
set -Eeuo pipefail

APP_ROOT=/var/www/html
DATA_ROOT="$APP_ROOT/documents"
MYSQL_ROOT=/var/lib/mysql
SEED_ROOT=/opt/dolibarr-seed
MYSQL_SOCKET=/run/mysqld/mysqld.sock
MYSQL_PIDFILE=/run/mysqld/mysqld.pid

mkdir -p "$DATA_ROOT" "$MYSQL_ROOT" /run/mysqld
if [[ ! -d "$MYSQL_ROOT/mysql" ]]; then
  cp -a "$SEED_ROOT/mysql/." "$MYSQL_ROOT/"
fi
if [[ ! -f "$DATA_ROOT/install.lock" && -f "$SEED_ROOT/documents/install.lock" ]]; then
  cp -a "$SEED_ROOT/documents/install.lock" "$DATA_ROOT/install.lock"
fi
chown -R mysql:mysql "$MYSQL_ROOT" /run/mysqld
chown -R www-data:www-data "$DATA_ROOT"

db_pid=''
apache_pid=''
shutdown() {
  trap - TERM INT EXIT
  [[ -n "$apache_pid" ]] && kill "$apache_pid" 2>/dev/null || true
  [[ -n "$db_pid" ]] && mariadb-admin --protocol=socket --socket="$MYSQL_SOCKET" -uroot shutdown >/dev/null 2>&1 || true
  [[ -n "$db_pid" ]] && kill "$db_pid" 2>/dev/null || true
  wait "$apache_pid" 2>/dev/null || true
  wait "$db_pid" 2>/dev/null || true
}
trap shutdown TERM INT EXIT

mariadbd --user=mysql --datadir="$MYSQL_ROOT" --bind-address=127.0.0.1 \
  --skip-networking=0 --socket="$MYSQL_SOCKET" --pid-file="$MYSQL_PIDFILE" \
  --log-error=/var/log/mysql/error.log &
db_pid=$!
ready=0
for _ in $(seq 1 120); do
  if mariadb-admin --protocol=socket --socket="$MYSQL_SOCKET" -uroot ping >/dev/null 2>&1; then
    ready=1
    break
  fi
  if ! kill -0 "$db_pid" 2>/dev/null; then
    echo 'MariaDB exited during startup' >&2
    exit 1
  fi
  sleep 1
done
if [[ "$ready" != 1 ]]; then
  echo 'MariaDB did not become ready within 120 seconds' >&2
  exit 1
fi

apachectl -DFOREGROUND &
apache_pid=$!
wait -n "$db_pid" "$apache_pid"
status=$?
echo "core process exited with status $status" >&2
exit "$status"

