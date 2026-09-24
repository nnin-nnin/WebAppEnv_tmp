#!/usr/bin/env bash
set -euo pipefail

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
    sleep 2
    WAIT=$((WAIT + 2))
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
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:18007/)
if [ "$HTTP_CODE" != "200" ]; then
    echo "ERROR: Web entrypoint returned HTTP code ${HTTP_CODE} (Expected: 200)"
    exit 1
fi

echo "=== 4. Checking Admin Web Login ==="
bash "${APP_DIR}/resources/login.sh"

echo "=== Healthcheck PASSED ==="
exit 0
