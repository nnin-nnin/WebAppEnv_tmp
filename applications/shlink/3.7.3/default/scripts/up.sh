#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${APP_DIR}/docker/compose.yaml"
HOST_PORT="${HOST_PORT:-18673}"

echo "Starting Shlink 3.7.3 with Docker Compose..."
cd "${APP_DIR}"
docker compose -f "${COMPOSE_FILE}" config --quiet
docker compose -f "${COMPOSE_FILE}" up -d

echo "Waiting for Shlink service to be responsive on port ${HOST_PORT}..."
TIMEOUT=60
ELAPSED=0
APP_READY=0

while [ $ELAPSED -lt $TIMEOUT ]; do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/rest/v3/health" 2>/dev/null || true)
    if [ "$HTTP_CODE" = "200" ]; then
        APP_READY=1
        break
    fi
    sleep 2
    ELAPSED=$((ELAPSED + 2))
done

if [ $APP_READY -ne 1 ]; then
    echo "Error: Shlink service did not become responsive within ${TIMEOUT} seconds."
    docker compose -f "${COMPOSE_FILE}" ps
    docker compose -f "${COMPOSE_FILE}" logs
    exit 1
fi

echo "Shlink startup completed successfully."
exit 0
