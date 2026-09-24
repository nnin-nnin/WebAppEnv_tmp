#!/usr/bin/env bash
set -euo pipefail

# Strip local proxies
export http_proxy=""
export https_proxy=""
export HTTP_PROXY=""
export HTTPS_PROXY=""
export all_proxy=""
export ALL_PROXY=""
export no_proxy="*"
export NO_PROXY="*"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${APP_DIR}/docker/compose.yaml"

echo "=== 1. Checking Compose Configuration ==="
docker compose -f "$COMPOSE_FILE" config --quiet

echo "=== 2. Checking Service Status ==="
MAX_WAIT=30
WAIT=0
DB_STATUS=""
APP_STATUS=""

while [ $WAIT -lt $MAX_WAIT ]; do
    DB_STATUS=$(docker compose -f "$COMPOSE_FILE" ps db --format "{{.Health}}" 2>/dev/null || echo "")
    APP_STATUS=$(docker compose -f "$COMPOSE_FILE" ps app --format "{{.State}}" 2>/dev/null || echo "")
    if [ "$DB_STATUS" = "healthy" ] && [ "$APP_STATUS" = "running" ]; then
        break
    fi
    sleep 1
    WAIT=$((WAIT + 1))
done

if [ "$DB_STATUS" != "healthy" ]; then
    echo "ERROR: Database service is not healthy (Status: ${DB_STATUS})"
    exit 1
fi

if [ "$APP_STATUS" != "running" ]; then
    echo "ERROR: Application service is not running (Status: ${APP_STATUS})"
    exit 1
fi

echo "=== 3. Checking Web Entrypoint ==="
HOST_PORT="${HOST_PORT:-18603}"
URL="http://${HOST:-localhost}:${HOST_PORT}"

HTTP_CODE=$(curl --noproxy "*" --max-time 5 -s -o /dev/null -w "%{http_code}" "${URL}/")
if [ "$HTTP_CODE" -lt 200 ] || [ "$HTTP_CODE" -ge 400 ]; then
    echo "ERROR: Web entrypoint returned HTTP code ${HTTP_CODE} (Expected: 2xx/3xx)"
    exit 1
fi

echo "=== Healthcheck PASSED ==="
exit 0
