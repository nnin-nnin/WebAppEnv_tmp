#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${APP_DIR}/docker/compose.yaml"
HOST_PORT="${HOST_PORT:-18827}"
UA="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"

echo "Validating Docker Compose configuration..."
docker compose -f "$COMPOSE_FILE" config --quiet

echo "Starting Gallery services..."
docker compose -f "$COMPOSE_FILE" up -d

echo "Waiting for Gallery services to become healthy (timeout: 120s)..."
MAX_ATTEMPTS=24
ATTEMPT=0

while [ $ATTEMPT -lt $MAX_ATTEMPTS ]; do
    ATTEMPT=$((ATTEMPT + 1))
    
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -A "$UA" "http://127.0.0.1:${HOST_PORT}/" || echo "000")
    if [ "$HTTP_CODE" = "200" ] || [ "$HTTP_CODE" = "302" ]; then
        echo "Gallery environment is UP and healthy on port ${HOST_PORT}!"
        docker compose -f "$COMPOSE_FILE" ps
        exit 0
    fi
    
    sleep 5
done

echo "ERROR: Gallery environment failed to start properly within 120 seconds."
docker compose -f "$COMPOSE_FILE" ps
docker compose -f "$COMPOSE_FILE" logs --tail 50
exit 1
