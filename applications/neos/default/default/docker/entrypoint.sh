#!/usr/bin/env bash
set -eo pipefail

DB_HOST="${DB_HOST:-db}"
DB_PORT="${DB_PORT:-3306}"
DB_DATABASE="${DB_DATABASE:-neos}"
DB_USER="${DB_USER:-neos}"
DB_PASSWORD="${DB_PASSWORD:-AdminPassword123!}"
FLOW_CONTEXT="${FLOW_CONTEXT:-Production}"

export DB_HOST DB_PORT DB_DATABASE DB_USER DB_PASSWORD FLOW_CONTEXT

echo "=== Initializing Neos CMS Environment ==="

# Disable client SSL requirement in MariaDB client config
mkdir -p /etc/mysql/conf.d
cat <<EOF > /etc/mysql/conf.d/disable-ssl.cnf
[client]
ssl = 0
EOF

# Write concrete configuration into Configuration/Settings.yaml
cat <<EOF > /var/www/html/Configuration/Settings.yaml
Neos:
  Flow:
    persistence:
      backendOptions:
        driver: 'pdo_mysql'
        host: '${DB_HOST}'
        port: ${DB_PORT}
        dbname: '${DB_DATABASE}'
        user: '${DB_USER}'
        password: '${DB_PASSWORD}'
        charset: 'utf8mb4'
    http:
      trustedProxies:
        proxies: '*'
EOF

# Ensure required directories exist
mkdir -p /var/www/html/Data/Logs \
         /var/www/html/Data/Persistent \
         /var/www/html/Data/Temporary \
         /var/www/html/Web/_Resources

# Wait for MariaDB service
echo "Waiting for MariaDB at ${DB_HOST}:${DB_PORT}..."
MAX_TRIES=60
TRIES=0
until mariadb-admin --skip-ssl ping -h "${DB_HOST}" -P "${DB_PORT}" -u "${DB_USER}" -p"${DB_PASSWORD}" --silent >/dev/null 2>&1; do
    TRIES=$((TRIES + 1))
    if [ "$TRIES" -ge "$MAX_TRIES" ]; then
        echo "Error: Timed out waiting for database."
        exit 1
    fi
    sleep 2
done
echo "Database is ready."

# Check if database has been migrated
TABLE_COUNT=$(mariadb --skip-ssl -h "${DB_HOST}" -P "${DB_PORT}" -u "${DB_USER}" -p"${DB_PASSWORD}" -D "${DB_DATABASE}" -sse "SELECT COUNT(*) FROM information_schema.tables WHERE table_schema='${DB_DATABASE}';" 2>/dev/null || echo 0)

if [ "$TABLE_COUNT" -eq 0 ]; then
    echo "Empty database detected. Running migrations and seeding..."
    su -s /bin/bash www-data -c "FLOW_CONTEXT=${FLOW_CONTEXT} ./flow doctrine:migrate" || true
    su -s /bin/bash www-data -c "FLOW_CONTEXT=${FLOW_CONTEXT} ./flow user:create admin AdminPassword123! Admin User --roles Neos.Neos:Administrator" || true
    su -s /bin/bash www-data -c "FLOW_CONTEXT=${FLOW_CONTEXT} ./flow site:import --package-key Neos.Demo" || true
fi

# Ensure permissions
chown -R www-data:www-data /var/www/html/Data /var/www/html/Configuration /var/www/html/Web/_Resources
chmod -R 775 /var/www/html/Data /var/www/html/Configuration

# Clear cache and publish resources
su -s /bin/bash www-data -c "FLOW_CONTEXT=${FLOW_CONTEXT} ./flow resource:publish" >/dev/null 2>&1 || true

echo "=== Neos initialization completed, starting Apache ==="
exec "$@"
