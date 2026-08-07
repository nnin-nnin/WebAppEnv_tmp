#!/usr/bin/env bash
set -Eeuo pipefail

DATA_DIR=/var/www/html/data
MYSQL_DIR=/var/lib/mysql
MYSQL_SEED=/opt/nextcloud/mysql-seed
MYSQL_SOCKET=/run/mysqld/mysqld.sock
MYSQL_PIDFILE=/run/mysqld/mysqld.pid

mkdir -p "$DATA_DIR" /run/mysqld "$MYSQL_DIR"
chown -R www-data:www-data "$DATA_DIR" /var/www/html/config
chown -R mysql:mysql /run/mysqld "$MYSQL_DIR"

if [[ ! -d "$MYSQL_DIR/mysql" ]]; then
    rm -rf "$MYSQL_DIR"/*
    cp -a "$MYSQL_SEED"/. "$MYSQL_DIR"/
    chown -R mysql:mysql "$MYSQL_DIR"
fi

rm -f "$MYSQL_SOCKET" "$MYSQL_PIDFILE"

mariadbd \
    --user=mysql \
    --datadir="$MYSQL_DIR" \
    --bind-address=127.0.0.1 \
    --port=3306 \
    --skip-name-resolve \
    --socket="$MYSQL_SOCKET" \
    --pid-file="$MYSQL_PIDFILE" &
DB_PID=$!

cleanup() {
    local status=$?
    trap - EXIT INT TERM
    if kill -0 "$DB_PID" 2>/dev/null; then
        mariadb-admin --socket="$MYSQL_SOCKET" -uroot shutdown >/dev/null 2>&1 || kill "$DB_PID" 2>/dev/null || true
    fi
    if [[ -n "${APACHE_PID:-}" ]] && kill -0 "$APACHE_PID" 2>/dev/null; then
        kill "$APACHE_PID" 2>/dev/null || true
    fi
    wait "$DB_PID" 2>/dev/null || true
    if [[ -n "${APACHE_PID:-}" ]]; then wait "$APACHE_PID" 2>/dev/null || true; fi
    exit "$status"
}
trap cleanup EXIT INT TERM

for attempt in $(seq 1 60); do
    if mariadb-admin --socket="$MYSQL_SOCKET" -uroot ping >/dev/null 2>&1; then
        break
    fi
    if ! kill -0 "$DB_PID" 2>/dev/null; then
        echo 'MariaDB exited before becoming ready' >&2
        exit 1
    fi
    sleep 1
    if [[ "$attempt" == 60 ]]; then
        echo 'Timed out waiting for MariaDB' >&2
        exit 1
    fi
done

if [[ -n "${NEXTCLOUD_TRUSTED_DOMAIN:-}" ]]; then
    su -s /bin/sh -c "php /var/www/html/occ config:system:set trusted_domains 3 --value=\"$NEXTCLOUD_TRUSTED_DOMAIN\"" www-data
fi

apache2-foreground &
APACHE_PID=$!
wait -n "$DB_PID" "$APACHE_PID"
exit $?

