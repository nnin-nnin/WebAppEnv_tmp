#!/usr/bin/env bash
set -e

DB_HOST="${DB_HOST:-db}"
DB_PORT="${DB_PORT:-3306}"
DB_NAME="${DB_NAME:-osclass}"
DB_USER="${DB_USER:-osclass}"
DB_PASS="${DB_PASSWORD:-osclass}"

echo "Waiting for database connection at ${DB_HOST}:${DB_PORT}..."
until mysqladmin ping -h"$DB_HOST" -P"$DB_PORT" -u"$DB_USER" -p"$DB_PASS" --silent 2>/dev/null; do
    sleep 2
done
echo "Database connection established."

# Ensure config.php exists
if [ ! -f /var/www/html/config.php ]; then
    cp /usr/local/share/osclass/config.php /var/www/html/config.php
fi

# Ensure uploads and downloads directories exist
mkdir -p /var/www/html/oc-content/uploads \
         /var/www/html/oc-content/downloads \
         /var/www/html/oc-content/languages

chown -R www-data:www-data /var/www/html/oc-content

exec "$@"
