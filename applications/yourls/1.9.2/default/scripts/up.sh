#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${APP_DIR}/docker/compose.yaml"
HOST_PORT="${HOST_PORT:-18654}"

echo "Starting YOURLS 1.9.2 with Docker Compose..."
cd "${APP_DIR}"
docker compose -f "${COMPOSE_FILE}" config --quiet
docker compose -f "${COMPOSE_FILE}" up -d

echo "Waiting for YOURLS service to be responsive on port ${HOST_PORT}..."
TIMEOUT=120
ELAPSED=0
APP_READY=0

while [ $ELAPSED -lt $TIMEOUT ]; do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/admin/" 2>/dev/null || true)
    if [ "$HTTP_CODE" = "200" ] || [ "$HTTP_CODE" = "302" ] || [ "$HTTP_CODE" = "307" ]; then
        APP_READY=1
        break
    fi
    sleep 2
    ELAPSED=$((ELAPSED + 2))
done

if [ $APP_READY -ne 1 ]; then
    echo "Error: YOURLS service did not become responsive within ${TIMEOUT} seconds."
    docker compose -f "${COMPOSE_FILE}" ps
    docker compose -f "${COMPOSE_FILE}" logs
    exit 1
fi

echo "Triggering initial database table setup if needed..."
curl -s -L "http://127.0.0.1:${HOST_PORT}/admin/install.php?install=1" > /dev/null 2>&1 || true

echo "YOURLS startup completed successfully."
exit 0
