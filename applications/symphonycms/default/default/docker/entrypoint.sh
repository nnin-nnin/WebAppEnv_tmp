#!/usr/bin/env bash
set -euo pipefail

DB_HOST="${DB_HOST:-db}"
DB_PORT="${DB_PORT:-3306}"
DB_NAME="${DB_NAME:-symphony_cms}"
DB_USER="${DB_USER:-symphony}"
DB_PASS="${DB_PASS:-benchmark-only}"

MYSQLADMIN_CMD="mysqladmin --skip-ssl"

echo "=== Waiting for database connection at ${DB_HOST}:${DB_PORT}... ==="
MAX_TRIES=60
COUNT=0
while ! ${MYSQLADMIN_CMD} ping -h "${DB_HOST}" -P "${DB_PORT}" -u "${DB_USER}" -p"${DB_PASS}" --silent; do
    COUNT=$((COUNT + 1))
    if [ $COUNT -ge $MAX_TRIES ]; then
        echo "ERROR: Database unreachable after ${MAX_TRIES} attempts."
        exit 1
    fi
    sleep 1
done
echo "Database is reachable."

# Execute Symphony initialization script
php /usr/local/bin/init-symphony.php

# Ensure proper permissions
chown -R www-data:www-data /var/www/html
chmod -R 775 /var/www/html/manifest /var/www/html/workspace /var/www/html/extensions 2>/dev/null || true

echo "=== Starting Apache Web Server ==="
exec "$@"
