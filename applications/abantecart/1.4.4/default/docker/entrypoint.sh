#!/bin/bash
set -e

DB_HOST="${DB_HOST:-db}"
DB_USER="${DB_USER:-abantecart}"
DB_PASS="${DB_PASS:-abantecart_pass}"
DB_NAME="${DB_NAME:-abantecart}"
ADMIN_USER="${ADMIN_USER:-admin}"
ADMIN_PASS="${ADMIN_PASS:-benchmark-only}"
HTTP_SERVER="${HTTP_SERVER:-http://localhost:18001/}"

echo "Waiting for database at $DB_HOST:3306..."
until mariadb-admin --host="$DB_HOST" --user="$DB_USER" --password="$DB_PASS" --skip-ssl ping --silent; do
    echo "Database unavailable, sleeping 2s..."
    sleep 2
done
echo "Database is ready!"

# Check if installed
if [ ! -f /var/www/html/system/config.php ] || ! grep -q "DB_HOSTNAME" /var/www/html/system/config.php; then
    echo "Running AbanteCart CLI installer..."
    php /var/www/html/install/cli_install.php install \
        --db_driver="amysqli" \
        --db_host="$DB_HOST" \
        --db_user="$DB_USER" \
        --db_password="$DB_PASS" \
        --db_name="$DB_NAME" \
        --db_prefix="ac_" \
        --admin_path="admin" \
        --username="$ADMIN_USER" \
        --password="$ADMIN_PASS" \
        --email="admin@example.com" \
        --http_server="$HTTP_SERVER" || true

    chown -R www-data:www-data /var/www/html
    chmod -R 777 /var/www/html/system/cache /var/www/html/system/logs /var/www/html/image
    echo "Installation finished!"
fi

echo "Starting Apache..."
exec apache2-foreground
