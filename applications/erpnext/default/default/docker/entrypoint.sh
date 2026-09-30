#!/bin/bash
set -e

# Link assets if not already linked
ASSETS_PATH="/home/frappe/frappe-bench/sites/assets"
BAKED_PATH="/home/frappe/frappe-bench/assets"
if [ ! -L "$ASSETS_PATH" ]; then
  echo "Linking fresh assets to volume..."
  rm -rf "$ASSETS_PATH"
  mkdir -p "$(dirname "$ASSETS_PATH")"
  ln -s "$BAKED_PATH" "$ASSETS_PATH"
fi

mkdir -p /home/frappe/logs /home/frappe/frappe-bench/logs /home/frappe/frappe-bench/sites/frontend/logs

DB_HOST="${DB_HOST:-db}"
DB_PORT="${DB_PORT:-3306}"
DB_NAME="${DB_NAME:-erpnext}"
DB_USER="${DB_USER:-erpnext}"
DB_PASSWORD="${DB_PASSWORD:-AdminPassword123!}"
REDIS_HOST="${REDIS_HOST:-redis}"
REDIS_PORT="${REDIS_PORT:-6379}"
SITE_NAME="${FRAPPE_SITE_NAME:-frontend}"

echo "Waiting for MariaDB at ${DB_HOST}:${DB_PORT}..."
until timeout 1 bash -c "</dev/tcp/${DB_HOST}/${DB_PORT}" 2>/dev/null; do
  sleep 1
done
echo "MariaDB port is open."

echo "Waiting for MariaDB schema to be initialized in ${DB_NAME}..."
until mariadb -h "${DB_HOST}" -P "${DB_PORT}" -u "${DB_USER}" -p"${DB_PASSWORD}" -e "SELECT 1 FROM \`tabUser\` LIMIT 1;" "${DB_NAME}" >/dev/null 2>&1; do
  sleep 2
done
echo "MariaDB schema is initialized."

echo "Waiting for Redis at ${REDIS_HOST}:${REDIS_PORT}..."
until timeout 1 bash -c "</dev/tcp/${REDIS_HOST}/${REDIS_PORT}" 2>/dev/null; do
  sleep 1
done
echo "Redis is available."

# Configure common_site_config.json
cat <<EOF > /home/frappe/frappe-bench/sites/common_site_config.json
{
  "db_host": "${DB_HOST}",
  "db_port": ${DB_PORT},
  "redis_cache": "redis://${REDIS_HOST}:${REDIS_PORT}",
  "redis_queue": "redis://${REDIS_HOST}:${REDIS_PORT}",
  "redis_socketio": "redis://${REDIS_HOST}:${REDIS_PORT}"
}
EOF

# Ensure apps.txt exists
if [ ! -f /home/frappe/frappe-bench/sites/apps.txt ]; then
  cat <<EOF > /home/frappe/frappe-bench/sites/apps.txt
frappe
erpnext
EOF
fi

# Configure site_config.json
mkdir -p "/home/frappe/frappe-bench/sites/${SITE_NAME}"
cat <<EOF > "/home/frappe/frappe-bench/sites/${SITE_NAME}/site_config.json"
{
  "db_name": "${DB_NAME}",
  "db_user": "${DB_USER}",
  "db_password": "${DB_PASSWORD}",
  "db_type": "mariadb"
}
EOF
echo "${SITE_NAME}" > /home/frappe/frappe-bench/sites/currentsite.txt

# Configure Nginx
export BACKEND="127.0.0.1:8000"
export SOCKETIO="127.0.0.1:9000"
export NGINX_LISTEN_PORT="80"
export FRAPPE_SITE_NAME_HEADER="${SITE_NAME}"
export UPSTREAM_REAL_IP_ADDRESS="127.0.0.1"
export UPSTREAM_REAL_IP_HEADER="X-Forwarded-For"
export UPSTREAM_REAL_IP_RECURSIVE="off"
export PROXY_READ_TIMEOUT="120"
export CLIENT_MAX_BODY_SIZE="50m"

envsubst '${BACKEND} ${SOCKETIO} ${NGINX_LISTEN_PORT} ${UPSTREAM_REAL_IP_ADDRESS} ${UPSTREAM_REAL_IP_HEADER} ${UPSTREAM_REAL_IP_RECURSIVE} ${FRAPPE_SITE_NAME_HEADER} ${PROXY_READ_TIMEOUT} ${CLIENT_MAX_BODY_SIZE}' \
  < /templates/nginx/frappe.conf.template > /etc/nginx/conf.d/frappe.conf

echo "Starting Nginx reverse proxy on port 80..."
nginx

echo "Starting Gunicorn backend on 127.0.0.1:8000..."
exec /home/frappe/frappe-bench/env/bin/gunicorn \
  --chdir=/home/frappe/frappe-bench/sites \
  --bind=127.0.0.1:8000 \
  --threads=4 \
  --workers=2 \
  --worker-class=gthread \
  --worker-tmp-dir=/dev/shm \
  --timeout=120 \
  --preload \
  frappe.app:application
