#!/usr/bin/env bash
set -e

chown -R www-data:www-data /var/www/html/system/storage /var/www/html/image
chmod -R 775 /var/www/html/system/storage /var/www/html/image

exec "$@"
