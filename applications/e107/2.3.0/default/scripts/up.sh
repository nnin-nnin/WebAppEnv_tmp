#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

echo "Starting e107 2.3.0 environment..."
cd "${APP_DIR}"

docker compose -f docker/compose.yaml config --quiet
docker compose -f docker/compose.yaml up -d

HOST_PORT="${HOST_PORT:-18604}"
ADMIN_USER="${ADMIN_USER:-${ADMIN_USERNAME:-admin}}"
ADMIN_PASS="${ADMIN_PASSWORD:-${PASSWORD:-AdminPassword123!}}"

echo "Waiting for e107 services (MariaDB & Apache) to initialize..."
MAX_RETRIES=60
RETRY_COUNT=0
MYSQL_READY=0

while [ ${RETRY_COUNT} -lt ${MAX_RETRIES} ]; do
    if docker compose -f docker/compose.yaml exec -T web mysqladmin --defaults-file=/etc/mysql/debian.cnf ping --silent >/dev/null 2>&1; then
        MYSQL_READY=1
        break
    fi
    RETRY_COUNT=$((RETRY_COUNT + 1))
    sleep 2
done

if [ ${MYSQL_READY} -eq 1 ]; then
    echo "MariaDB is operational. Setting admin credentials..."
    docker compose -f docker/compose.yaml exec -T web /usr/lib/inithooks/bin/e107.py --pass="${ADMIN_PASS}" --email="admin@example.com" >/dev/null 2>&1 || true
else
    echo "WARNING: MariaDB ping timed out during startup wait."
fi

# Wait for HTTP endpoint to return 200
HTTP_RETRIES=30
HTTP_COUNT=0
while [ ${HTTP_COUNT} -lt ${HTTP_RETRIES} ]; do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://localhost:${HOST_PORT}/" || true)
    if [ "$HTTP_CODE" -eq 200 ]; then
        echo "e107 web service is ready (HTTP 200)!"
        break
    fi
    HTTP_COUNT=$((HTTP_COUNT + 1))
    sleep 2
done

echo "e107 startup complete."
