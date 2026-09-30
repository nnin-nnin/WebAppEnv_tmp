#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${APP_DIR}/docker/compose.yaml"
HOST_PORT="${HOST_PORT:-18812}"
UA="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"

echo "Validating Docker Compose configuration..."
docker compose -f "$COMPOSE_FILE" config --quiet

echo "Starting CubeCart services..."
docker compose -f "$COMPOSE_FILE" up -d

echo "Waiting for CubeCart services to become healthy (timeout: 180s)..."
MAX_ATTEMPTS=36
ATTEMPT=0

while [ $ATTEMPT -lt $MAX_ATTEMPTS ]; do
    ATTEMPT=$((ATTEMPT + 1))
    
    DB_STATUS=$(docker compose -f "$COMPOSE_FILE" ps db --format "{{.Health}}" 2>/dev/null || echo "")
    APP_STATUS=$(docker compose -f "$COMPOSE_FILE" ps app --format "{{.State}}" 2>/dev/null || echo "")
    
    if [ "$DB_STATUS" = "healthy" ] && [ "$APP_STATUS" = "running" ]; then
        HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -A "$UA" "http://127.0.0.1:${HOST_PORT}/" || echo "000")
        if [ "$HTTP_CODE" = "200" ] || [ "$HTTP_CODE" = "302" ]; then
            echo "CubeCart environment is UP and healthy on port ${HOST_PORT}!"
            docker compose -f "$COMPOSE_FILE" ps
            exit 0
        fi
    fi
    
    sleep 5
done

echo "ERROR: CubeCart environment failed to start properly within 180 seconds."
docker compose -f "$COMPOSE_FILE" ps
docker compose -f "$COMPOSE_FILE" logs --tail 50
exit 1
