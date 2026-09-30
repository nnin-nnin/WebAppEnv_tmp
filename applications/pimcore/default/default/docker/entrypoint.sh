#!/usr/bin/env bash
set -eo pipefail

echo "=== Initializing Pimcore Environment ==="

DB_HOST="${PIMCORE_DB_HOST:-db}"
DB_PORT="${PIMCORE_DB_PORT:-3306}"
DB_NAME="${PIMCORE_DB_NAME:-pimcore}"
DB_USER="${PIMCORE_DB_USER:-pimcore}"
DB_PASSWORD="${PIMCORE_DB_PASSWORD:-pimcore}"

export PIMCORE_DB_HOST DB_HOST DB_PORT DB_NAME DB_USER DB_PASSWORD

echo "Waiting for MariaDB at ${DB_HOST}:${DB_PORT}..."
MAX_TRIES=60
TRIES=0
until mariadb-admin ping -h "${DB_HOST}" -P "${DB_PORT}" -u "${DB_USER}" -p"${DB_PASSWORD}" --silent >/dev/null 2>&1; do
    TRIES=$((TRIES + 1))
    if [ "$TRIES" -ge "$MAX_TRIES" ]; then
        echo "Warning: Database not ready after ${MAX_TRIES}s, continuing startup..."
        break
    fi
    sleep 1
done
echo "Database is ready."

mkdir -p /var/www/html/var/cache /var/www/html/var/log /var/www/html/var/tmp /var/www/html/public/var
chown -R www-data:www-data /var/www/html/var /var/www/html/public/var
chmod -R 775 /var/www/html/var /var/www/html/public/var

echo "Starting PHP-FPM daemon..."
php-fpm -D

echo "=== Starting Apache ==="
exec "$@"
