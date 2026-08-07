#!/usr/bin/env bash
set -Eeuo pipefail

data_dir="${MYSQL_DATADIR:-/var/lib/mysql}"
seed_dir="/opt/opencart-db-seed"
socket="/run/mysqld/mysqld.sock"
pid_file="/run/mysqld/mysqld.pid"
log_file="/var/log/mysql/opencart.log"

install -d -o mysql -g mysql /run/mysqld /var/log/mysql

if [ ! -d "$data_dir/mysql" ]; then
    find "$data_dir" -mindepth 1 -maxdepth 1 -exec rm -rf {} +
    cp -a "$seed_dir"/. "$data_dir"/
    chown -R mysql:mysql "$data_dir"
fi

mysqld --user=mysql --datadir="$data_dir" --bind-address=127.0.0.1 --socket="$socket" --pid-file="$pid_file" --log-error="$log_file" &
db_pid=$!

for attempt in $(seq 1 60); do
    if mariadb-admin --protocol=socket --socket="$socket" ping >/dev/null 2>&1; then
        break
    fi
    if ! kill -0 "$db_pid" 2>/dev/null; then
        echo 'OpenCart container stopped: MariaDB failed during startup.' >&2
        exit 1
    fi
    sleep 1
done
mariadb-admin --protocol=socket --socket="$socket" ping >/dev/null

apache2-foreground &
apache_pid=$!

shutdown() {
    trap - TERM INT QUIT EXIT
    kill -TERM "$apache_pid" 2>/dev/null || true
    kill -TERM "$db_pid" 2>/dev/null || true
    wait "$apache_pid" 2>/dev/null || true
    wait "$db_pid" 2>/dev/null || true
}
trap shutdown TERM INT QUIT

while :; do
    if ! kill -0 "$db_pid" 2>/dev/null; then
        echo 'OpenCart container stopped: MariaDB exited.' >&2
        shutdown
        exit 1
    fi
    if ! kill -0 "$apache_pid" 2>/dev/null; then
        echo 'OpenCart container stopped: Apache exited.' >&2
        shutdown
        exit 1
    fi
    sleep 2
done
