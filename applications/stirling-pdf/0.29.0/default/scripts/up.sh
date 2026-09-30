#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${APP_DIR}/docker/compose.yaml"
HOST_PORT="${HOST_PORT:-18676}"
APP_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"

echo "Checking Docker Compose configuration..."
docker compose -f "${COMPOSE_FILE}" config --quiet

echo "Starting Stirling-PDF service..."
docker compose -f "${COMPOSE_FILE}" up -d

echo "Waiting for Stirling-PDF service to become ready..."
TIMEOUT=90
ELAPSED=0

while [ ${ELAPSED} -lt ${TIMEOUT} ]; do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/" || true)
    if [ "${HTTP_CODE}" = "200" ]; then
        echo "Stirling-PDF is up and healthy! (HTTP 200)"
        docker compose -f "${COMPOSE_FILE}" ps
        exit 0
    fi
    sleep 2
    ELAPSED=$((ELAPSED + 2))
done

echo "Error: Stirling-PDF service did not respond with HTTP 200 within ${TIMEOUT} seconds."
docker compose -f "${COMPOSE_FILE}" ps
docker compose -f "${COMPOSE_FILE}" logs
exit 1
