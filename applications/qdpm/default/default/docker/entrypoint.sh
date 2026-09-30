#!/usr/bin/env bash
set -euo pipefail

DB_HOST="${DB_HOST:-db}"
DB_PORT="${DB_PORT:-3306}"
DB_NAME="${DB_NAME:-qdpm}"
DB_USER="${DB_USER:-qdpm}"
DB_PASS="${DB_PASS:-benchmark-only}"

echo "=== Waiting for MariaDB connection at ${DB_HOST}:${DB_PORT}... ==="
MAX_TRIES=60
COUNT=0
while ! mysqladmin --skip-ssl ping -h "${DB_HOST}" -P "${DB_PORT}" -u "${DB_USER}" -p"${DB_PASS}" --silent; do
    COUNT=$((COUNT + 1))
    if [ $COUNT -ge $MAX_TRIES ]; then
        echo "ERROR: MariaDB unreachable after ${MAX_TRIES} attempts."
        exit 1
    fi
    sleep 1
done
echo "MariaDB is reachable."

# Ensure databases.yml exists with current environment
cat << DBEOF > /var/www/html/core/config/databases.yml
all:
  doctrine:
    class: sfDoctrineDatabase
    param:
      dsn: 'mysql:dbname=${DB_NAME};host=${DB_HOST};port=${DB_PORT}'
      profiler: false
      username: ${DB_USER}
      password: ${DB_PASS}
      attributes:
        quote_identifier: true
DBEOF

# Ensure cache, logs, uploads permissions
mkdir -p /var/www/html/core/cache /var/www/html/core/log /var/www/html/uploads /var/www/html/backups
chown -R www-data:www-data /var/www/html/core/cache /var/www/html/core/log /var/www/html/uploads /var/www/html/backups /var/www/html/core/config
chmod -R 775 /var/www/html/core/cache /var/www/html/core/log /var/www/html/uploads /var/www/html/backups /var/www/html/core/config

echo "=== Starting Apache Web Server ==="
exec "$@"
