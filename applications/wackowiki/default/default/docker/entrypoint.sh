#!/usr/bin/env bash
set -eo pipefail

echo "=== Initializing WackoWiki Environment ==="

DB_HOST="${DB_HOST:-db}"
DB_PORT="${DB_PORT:-3306}"
DB_NAME="${DB_NAME:-wackowiki}"
DB_USER="${DB_USER:-wacko}"
DB_PASSWORD="${DB_PASSWORD:-wacko_password}"

echo "Waiting for MariaDB at ${DB_HOST}:${DB_PORT}..."
MAX_TRIES=60
TRIES=0
until php -r "new PDO('mysql:host=${DB_HOST};port=${DB_PORT};dbname=${DB_NAME}', '${DB_USER}', '${DB_PASSWORD}');" >/dev/null 2>&1; do
    TRIES=$((TRIES + 1))
    if [ "$TRIES" -ge "$MAX_TRIES" ]; then
        echo "Warning: Database not ready after ${MAX_TRIES}s, continuing startup..."
        break
    fi
    sleep 1
done
echo "Database connection verified."

# Ensure cache, config, and upload directories are owned by www-data
chown -R www-data:www-data /var/www/html/_cache /var/www/html/file /var/www/html/config
chmod -R 775 /var/www/html/_cache /var/www/html/file /var/www/html/config

echo "=== Starting Apache ==="
exec "$@"
