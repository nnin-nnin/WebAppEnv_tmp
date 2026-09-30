#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${APP_DIR}/docker/compose.yaml"
HOST_PORT="${HOST_PORT:-18644}"
URL="http://127.0.0.1:${HOST_PORT}"

echo "=== Health Checking XpressEngine at ${URL} ==="
cd "${APP_DIR}"

docker compose -f "${COMPOSE_FILE}" config --quiet

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${URL}/" || true)

if [ "${HTTP_CODE}" -eq 200 ]; then
    echo "SUCCESS: Endpoint ${URL}/ returned HTTP 200!"
else
    echo "ERROR: Endpoint ${URL}/ returned HTTP ${HTTP_CODE} (expected 200)"
    docker compose -f "${COMPOSE_FILE}" ps
    docker compose -f "${COMPOSE_FILE}" logs --tail=30
    exit 1
fi

echo "=== XpressEngine Health Check PASSED ==="
exit 0
