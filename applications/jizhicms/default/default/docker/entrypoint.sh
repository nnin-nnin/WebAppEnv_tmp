#!/usr/bin/env bash
set -euo pipefail

DB_HOST="${DB_HOST:-db}"
DB_PORT="${DB_PORT:-3306}"
DB_NAME="${DB_NAME:-jizhicms}"
DB_USER="${DB_USER:-jizhicms}"
DB_PASS="${DB_PASS:-benchmark-only}"
ADMIN_USERNAME="${ADMIN_USERNAME:-admin}"
ADMIN_PASSWORD="${ADMIN_PASSWORD:-AdminPassword123!}"

echo "=== Waiting for database connection at ${DB_HOST}:${DB_PORT}... ==="
MAX_TRIES=60
COUNT=0
while ! mysqladmin ping -h "${DB_HOST}" -P "${DB_PORT}" -u "${DB_USER}" -p"${DB_PASS}" --silent; do
    COUNT=$((COUNT + 1))
    if [ $COUNT -ge $MAX_TRIES ]; then
        echo "ERROR: Database unreachable after ${MAX_TRIES} attempts."
        exit 1
    fi
    sleep 1
done
echo "Database is reachable."

# Check if jz_level table exists
TABLE_EXISTS=$(mysql -h "${DB_HOST}" -P "${DB_PORT}" -u "${DB_USER}" -p"${DB_PASS}" "${DB_NAME}" -e "SHOW TABLES LIKE 'jz_level';" -s -N 2>/dev/null || true)

if [ -z "$TABLE_EXISTS" ]; then
    echo "=== Initializing JiZhiCMS Database Schema ==="
    if [ -f /docker-entrypoint-initdb.d/01-database-seed.sql ]; then
        mysql -h "${DB_HOST}" -P "${DB_PORT}" -u "${DB_USER}" -p"${DB_PASS}" "${DB_NAME}" < /docker-entrypoint-initdb.d/01-database-seed.sql
    elif [ -f /var/www/html/resources/database-seed.sql ]; then
        mysql -h "${DB_HOST}" -P "${DB_PORT}" -u "${DB_USER}" -p"${DB_PASS}" "${DB_NAME}" < /var/www/html/resources/database-seed.sql
    fi
    echo "Base database schema imported."
fi

# Ensure admin credentials and disabled verification code in DB
# Admin password hash for AdminPassword123! is b75dc822eea4860c487140790c401012
mysql -h "${DB_HOST}" -P "${DB_PORT}" -u "${DB_USER}" -p"${DB_PASS}" "${DB_NAME}" <<EOSQL
UPDATE \`jz_level\` SET \`name\` = '${ADMIN_USERNAME}', \`pass\` = 'b75dc822eea4860c487140790c401012', \`status\` = 1 WHERE \`id\` = 1;
UPDATE \`jz_sysconfig\` SET \`data\` = '1' WHERE \`field\` = 'closeadminvercode';
EOSQL

# Generate conf/config.php
cat <<EOF > /var/www/html/conf/config.php
<?php return array (
  'db' => 
  array (
    'host' => '${DB_HOST}',
    'dbname' => '${DB_NAME}',
    'username' => '${DB_USER}',
    'password' => '${DB_PASS}',
    'prefix' => 'jz_',
    'port' => '${DB_PORT}',
  ),
  'redis' => 
  array (
    'SAVE_HANDLE' => 'Redis',
    'HOST' => '127.0.0.1',
    'PORT' => 6379,
    'AUTH' => NULL,
    'TIMEOUT' => 0,
    'RESERVED' => NULL,
    'RETRY_INTERVAL' => 100,
    'RECONNECT' => false,
    'EXPIRE' => 1800,
  ),
  'APP_DEBUG' => false,
  'File_TXT_HIDE' => false,
); ?>
EOF

# Ensure install.lock exists to disable installer
touch /var/www/html/install/install.lock

# Ensure runtime directories exist
mkdir -p /var/www/html/cache /var/www/html/backup /var/www/html/static /var/www/html/conf

# Clean cache
rm -rf /var/www/html/cache/* 2>/dev/null || true

# Set appropriate directory permissions
chown -R www-data:www-data /var/www/html/cache /var/www/html/conf /var/www/html/install /var/www/html/static /var/www/html/backup 2>/dev/null || true

echo "=== JiZhiCMS Initialization Complete ==="
echo "=== Starting Apache Web Server ==="
exec "$@"
