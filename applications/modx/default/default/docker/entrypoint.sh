#!/usr/bin/env bash
set -e

# Ensure permissions
mkdir -p /var/www/html/core/cache \
         /var/www/html/core/packages \
         /var/www/html/assets/images \
         /var/www/html/assets/files \
         /var/www/html/assets/backup

# Ensure config file exists
if [ ! -f /var/www/html/core/config/config.inc.php ] && [ -f /var/www/html/core/config/config.inc.php.default ]; then
    cp /var/www/html/core/config/config.inc.php.default /var/www/html/core/config/config.inc.php
fi

chown -R www-data:www-data /var/www/html/core/cache \
                           /var/www/html/core/packages \
                           /var/www/html/assets \
                           /var/www/html/core/config

chmod -R 777 /var/www/html/core/cache \
             /var/www/html/core/packages \
             /var/www/html/assets

# Clear cache to ensure clean boot with freshly seeded database
rm -rf /var/www/html/core/cache/*

exec "$@"
