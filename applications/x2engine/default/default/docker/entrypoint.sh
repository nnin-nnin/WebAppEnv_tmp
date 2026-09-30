#!/bin/bash
set -e

mkdir -p /var/www/html/assets /var/www/html/protected/runtime /var/www/html/uploads /var/www/html/custom
chown -R www-data:www-data /var/www/html/assets /var/www/html/protected/runtime /var/www/html/uploads /var/www/html/custom /var/www/html/protected/config 2>/dev/null || true
chmod -R 777 /var/www/html/assets /var/www/html/protected/runtime /var/www/html/uploads /var/www/html/custom 2>/dev/null || true

exec "$@"
