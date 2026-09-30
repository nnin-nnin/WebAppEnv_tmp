#!/usr/bin/env bash
set -e

mkdir -p /var/www/html/local/config /var/www/html/local/media /var/www/html/local/session /var/www/html/var /var/www/html/cache
chown -R www-data:www-data /var/www/html/local /var/www/html/var /var/www/html/cache /var/www/html/web 2>/dev/null || true
chmod -R 777 /var/www/html/local/media /var/www/html/local/session /var/www/html/var /var/www/html/cache 2>/dev/null || true

echo "Waiting for database connection..."
for i in {1..60}; do
    if php -r "try { new PDO('mysql:host=db;port=3306;dbname=thelia', 'thelia', 'AdminPassword123!'); exit(0); } catch(Exception \$e) { exit(1); }"; then
        echo "Database is ready!"
        break
    fi
    sleep 1
done

rm -rf /var/www/html/cache/* 2>/dev/null || true

exec apache2-foreground
