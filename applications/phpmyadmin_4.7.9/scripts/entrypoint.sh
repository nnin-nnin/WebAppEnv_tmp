#!/usr/bin/env bash
set -euo pipefail

DATADIR="${MYSQL_DATADIR:-/var/lib/mysql}"
SOCKET="/var/run/mysqld/mysqld.sock"
MYSQL_LOG="/var/log/mysql/all-in-one.err"
ROOT_PASSWORD="${MYSQL_ROOT_PASSWORD:-benchmark-only}"
mkdir -p "$DATADIR" /var/run/mysqld /var/log/mysql /var/www/html/data/tmp /var/www/html/data/upload /var/www/html/data/save
chown -R mysql:mysql "$DATADIR" /var/run/mysqld /var/log/mysql /var/www/html/data

wait_for_mysql() {
    for _ in $(seq 1 60); do
        if mysqladmin --socket="$SOCKET" --protocol=socket ping --silent >/dev/null 2>&1; then
            return 0
        fi
        sleep 1
    done
    echo "MariaDB 未能在 60 秒内就绪" >&2
    return 1
}

if [ ! -f "$DATADIR/.phpmyadmin-initialized" ]; then
    if [ -d "$DATADIR/mysql" ]; then
        echo "发现未标记的 MariaDB 数据目录，跳过破坏性重建并继续初始化" >&2
    else
        mysql_install_db --user=mysql --datadir="$DATADIR" --skip-test-db >/dev/null
    fi
    mysqld --user=mysql --datadir="$DATADIR" --skip-networking --socket="$SOCKET" --pid-file=/var/run/mysqld/bootstrap.pid --log-error="$MYSQL_LOG" &
    bootstrap_pid=$!
    trap 'kill "$bootstrap_pid" 2>/dev/null || true' EXIT
    wait_for_mysql
    mysql --socket="$SOCKET" --protocol=socket -uroot < /usr/local/share/phpmyadmin/database-seed.sql
    mysql --socket="$SOCKET" --protocol=socket -uroot -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${ROOT_PASSWORD}'; FLUSH PRIVILEGES;"
    mysqladmin --socket="$SOCKET" --protocol=socket -uroot -p"$ROOT_PASSWORD" shutdown
    wait "$bootstrap_pid" || true
    trap - EXIT
    touch "$DATADIR/.phpmyadmin-initialized"
fi

mysqld --user=mysql --datadir="$DATADIR" --bind-address=127.0.0.1 --port=3306 --socket="$SOCKET" --pid-file=/var/run/mysqld/mysqld.pid --log-error="$MYSQL_LOG" &
mysql_pid=$!
apache2-foreground &
apache_pid=$!

shutdown() {
    trap - TERM INT EXIT
    if kill -0 "$apache_pid" 2>/dev/null; then
        apachectl -k graceful-stop >/dev/null 2>&1 || true
    fi
    if kill -0 "$mysql_pid" 2>/dev/null; then
        mysqladmin --protocol=TCP -h127.0.0.1 -uadmin -p"$ROOT_PASSWORD" shutdown >/dev/null 2>&1 || \
            mysqladmin --socket="$SOCKET" --protocol=socket -uroot -p"$ROOT_PASSWORD" shutdown >/dev/null 2>&1 || true
    fi
    sleep 1
    kill "$apache_pid" "$mysql_pid" 2>/dev/null || true
    wait "$apache_pid" 2>/dev/null || true
    wait "$mysql_pid" 2>/dev/null || true
    exit 0
}
trap shutdown TERM INT EXIT

while kill -0 "$mysql_pid" 2>/dev/null && kill -0 "$apache_pid" 2>/dev/null; do
    sleep 1
done

if ! kill -0 "$mysql_pid" 2>/dev/null; then
    echo "MariaDB 进程异常退出" >&2
else
    echo "Apache 进程异常退出" >&2
fi
exit 1
