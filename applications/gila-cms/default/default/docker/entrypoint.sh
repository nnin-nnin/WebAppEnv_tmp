#!/usr/bin/env bash
set -e

mkdir -p /var/www/html/log/cacheItem /var/www/html/log/sessions /var/www/html/log/stats /var/www/html/tmp /var/www/html/data /var/www/html/sites /var/www/html/assets/uploads

if [ ! -f /var/www/html/config.php ]; then
    cp /var/www/html/config.default.php /var/www/html/config.php 2>/dev/null || true
fi

chown -R www-data:www-data /var/www/html/log /var/www/html/tmp /var/www/html/data /var/www/html/sites /var/www/html/assets /var/www/html/config.php 2>/dev/null || true
chmod -R 777 /var/www/html/log /var/www/html/tmp /var/www/html/data /var/www/html/sites /var/www/html/assets 2>/dev/null || true

exec "$@"
