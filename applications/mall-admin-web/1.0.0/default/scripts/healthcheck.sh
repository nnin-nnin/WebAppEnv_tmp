#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${APP_DIR}/docker/compose.yaml"
HOST_PORT="${HOST_PORT:-18752}"
BASE_URL="${BASE_URL:-http://127.0.0.1:${HOST_PORT}}"

echo "Checking Docker Compose service status..."
RUNNING=$(docker compose -f "${COMPOSE_FILE}" ps -q 2>/dev/null | wc -l | tr -d ' ')
if [ "${RUNNING}" -lt 1 ]; then
    echo "Error: No running containers found."
    docker compose -f "${COMPOSE_FILE}" ps
    exit 1
fi

echo "Checking web interface endpoint (${BASE_URL}/)..."
HTTP_CODE=$(curl -s -L -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)
if [ "${HTTP_CODE}" -ne 200 ]; then
    echo "Error: ${BASE_URL}/ returned HTTP ${HTTP_CODE}, expected 200."
    exit 1
fi

echo "Performing login verification..."
"${APP_DIR}/resources/login.sh"

echo "Health check passed successfully!"
exit 0
