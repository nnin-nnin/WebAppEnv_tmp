#!/bin/bash
set -e

DB_HOST="${DB_HOST:-db}"
DB_PORT="${DB_PORT:-3306}"
DB_USER="${DB_USER:-oxid}"
DB_PASS="${DB_PASS:-oxid_pass}"
DB_NAME="${DB_NAME:-oxideshop}"
SHOP_BASE_URL="${SHOP_BASE_URL:-http://localhost:18851/}"
ADMIN_EMAIL="${ADMIN_EMAIL:-admin@example.com}"
ADMIN_PASSWORD="${ADMIN_PASSWORD:-AdminPassword123!}"

echo "Waiting for database at ${DB_HOST}:${DB_PORT}..."
until mariadb-admin --host="${DB_HOST}" --port="${DB_PORT}" --user="${DB_USER}" --password="${DB_PASS}" --skip-ssl ping --silent; do
    echo "Database unavailable, waiting 2s..."
    sleep 2
done
echo "Database is ready!"

# Ensure environment file .env is configured
cat << ENV_EOF > /var/www/eshop/.env
OXID_ENV=prod
OXID_DEFAULT_TIMEZONE=Europe/Berlin
OXID_LOG_LEVEL=error
OXID_DEBUG_MODE=false
OXID_DB_URL=mysql://${DB_USER}:${DB_PASS}@${DB_HOST}:${DB_PORT}/${DB_NAME}?charset=utf8&driverOptions[1002]="SET @@SESSION.sql_mode=\"\""
OXID_BUILD_DIRECTORY=/var/www/eshop/var/cache/
OXID_SHOP_BASE_URL=${SHOP_BASE_URL}
ENV_EOF

# Ensure writable directories
mkdir -p /var/www/eshop/var/cache /var/www/eshop/var/configuration /var/www/eshop/source/log
chown -R www-data:www-data /var/www/eshop/var /var/www/eshop/source/log /var/www/eshop/source/out

# Check if tables are loaded; if not, initialize shop
TABLE_COUNT=$(mariadb --host="${DB_HOST}" --port="${DB_PORT}" --user="${DB_USER}" --password="${DB_PASS}" --skip-ssl -D "${DB_NAME}" -sNe "SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = '${DB_NAME}';" 2>/dev/null || echo "0")

if [ "$TABLE_COUNT" -eq 0 ]; then
    echo "Database appears empty, executing shop setup..."
    php bin/oe-console oe:setup:shop
    php bin/oe-console oe:theme:activate apex
    php bin/oe-console oe:admin:create-user "${ADMIN_EMAIL}" "${ADMIN_PASSWORD}"
fi

echo "Starting Apache..."
exec apache2-foreground
