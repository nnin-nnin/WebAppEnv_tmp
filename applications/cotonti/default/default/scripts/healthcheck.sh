#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18809}"
BASE_URL="http://${HOST:-127.0.0.1}:${HOST_PORT}"

echo "Checking Cotonti health status at ${BASE_URL}..."

docker compose -f "${APP_DIR}/docker/compose.yaml" ps | grep -q "Up" || {
    echo "Healthcheck failed: containers are not running"
    exit 1
}

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)

if [ "${HTTP_CODE}" -eq 200 ] || [ "${HTTP_CODE}" -eq 302 ]; then
    echo "Healthcheck passed: HTTP ${HTTP_CODE} received from ${BASE_URL}/"
    exit 0
else
    echo "Healthcheck failed: HTTP ${HTTP_CODE} received from ${BASE_URL}/ (expected 200 or 302)"
    exit 1
fi
