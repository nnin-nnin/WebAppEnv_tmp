#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

echo "Starting Mahara 21.04.0 environment..."
cd "${APP_DIR}"

docker compose -f docker/compose.yaml config --quiet
docker compose -f docker/compose.yaml up -d

HOST_PORT="${HOST_PORT:-18621}"
ADMIN_USER="${ADMIN_USER:-${ADMIN_USERNAME:-admin}}"
ADMIN_PASS="${ADMIN_PASSWORD:-${PASSWORD:-AdminPassword123!}}"

echo "Preseeding TurnKey inithooks credentials..."
docker compose -f docker/compose.yaml exec -T web bash -c "cat > /etc/inithooks.conf << 'EOF'
export ROOT_PASS=${ADMIN_PASS}
export DB_PASS=${ADMIN_PASS}
export APP_PASS=${ADMIN_PASS}
export APP_EMAIL=admin@example.com
export APP_DOMAIN=DEFAULT
export HUB_APIKEY=SKIP
export SEC_ALERTS=SKIP
export SEC_UPDATES=SKIP
EOF" >/dev/null 2>&1 || true

echo "Waiting for PostgreSQL service to initialize..."
MAX_RETRIES=60
RETRY_COUNT=0
PG_READY=0

while [ ${RETRY_COUNT} -lt ${MAX_RETRIES} ]; do
    if docker compose -f docker/compose.yaml exec -T web service postgresql status >/dev/null 2>&1; then
        PG_READY=1
        break
    fi
    docker compose -f docker/compose.yaml exec -T web service postgresql start >/dev/null 2>&1 || true
    RETRY_COUNT=$((RETRY_COUNT + 1))
    sleep 2
done

if [ ${PG_READY} -eq 1 ]; then
    echo "PostgreSQL is operational. Setting admin credentials..."
    docker compose -f docker/compose.yaml exec -T web /usr/lib/inithooks/bin/mahara.py --pass="${ADMIN_PASS}" --email="admin@example.com" >/dev/null 2>&1 || true
else
    echo "WARNING: PostgreSQL status timed out during startup wait."
fi

echo "Configuring Apache HTTP access..."
# Ensure Apache service is active
docker compose -f docker/compose.yaml exec -T web service apache2 status >/dev/null 2>&1 || docker compose -f docker/compose.yaml exec -T web service apache2 start >/dev/null 2>&1 || true

# Disable mandatory HTTPS redirection so container port 80 directly serves HTTP
docker compose -f docker/compose.yaml exec -T web sed -i 's/RewriteRule ^\/?(.*) https/#RewriteRule ^\/?(.*) https/' /etc/apache2/sites-available/mahara.conf >/dev/null 2>&1 || true
docker compose -f docker/compose.yaml exec -T web service apache2 reload >/dev/null 2>&1 || true

echo "Waiting for HTTP endpoint to become ready..."
HTTP_RETRIES=40
HTTP_COUNT=0
while [ ${HTTP_COUNT} -lt ${HTTP_RETRIES} ]; do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/" || true)
    if [ "$HTTP_CODE" -eq 200 ]; then
        echo "Mahara web service is ready (HTTP 200)!"
        break
    fi
    HTTP_COUNT=$((HTTP_COUNT + 1))
    sleep 2
done

echo "Mahara startup complete."
