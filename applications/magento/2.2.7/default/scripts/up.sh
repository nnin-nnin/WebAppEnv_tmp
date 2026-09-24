#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
COMPOSE_FILE="$APP_DIR/docker/compose.yaml"
HOST_PORT="${HOST_PORT:-18636}"

cd "$APP_DIR"
echo "Starting Magento 2.2.7 with Docker Compose..."
docker compose -f "$COMPOSE_FILE" up -d

echo "Waiting for Magento to become ready on port ${HOST_PORT}..."
for i in $(seq 1 60); do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -L -H "User-Agent: Mozilla/5.0" "http://127.0.0.1:${HOST_PORT}/" 2>/dev/null || true)
    if [ "$HTTP_CODE" = "200" ] || [ "$HTTP_CODE" = "302" ]; then
        echo "Magento 2.2.7 is ready (HTTP ${HTTP_CODE})!"
        exit 0
    fi
    sleep 2
done

echo "Error: Magento startup wait timed out"
docker compose -f "$COMPOSE_FILE" ps
docker compose -f "$COMPOSE_FILE" logs --tail=50
exit 1
