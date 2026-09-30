#!/bin/bash
set -e

DB_HOST=${DB_HOST:-db}
DB_PORT=${DB_PORT:-3306}
DB_USER=${DB_USER:-root}
DB_PASS=${DB_PASS:-AdminPassword123!}
DB_NAME=${DB_NAME:-zurmo}

echo "[entrypoint] Waiting for database at ${DB_HOST}:${DB_PORT}..."
until mysqladmin ping -h"$DB_HOST" -P"$DB_PORT" -u"$DB_USER" -p"$DB_PASS" --silent 2>/dev/null; do
    sleep 1
done
echo "[entrypoint] Database is ready."

if [ ! -f /var/www/html/app/protected/config/perInstance.php ]; then
    cp /usr/local/etc/zurmo/perInstance.php /var/www/html/app/protected/config/perInstance.php
fi
if [ ! -f /var/www/html/app/protected/config/debug.php ]; then
    cp /usr/local/etc/zurmo/debug.php /var/www/html/app/protected/config/debug.php
fi

mkdir -p /var/www/html/app/protected/runtime /var/www/html/app/assets /var/www/html/app/protected/data
chown -R www-data:www-data /var/www/html/app/protected/runtime /var/www/html/app/assets /var/www/html/app/protected/config /var/www/html/app/protected/data
chmod -R 775 /var/www/html/app/protected/runtime /var/www/html/app/assets /var/www/html/app/protected/config

exec "$@"
