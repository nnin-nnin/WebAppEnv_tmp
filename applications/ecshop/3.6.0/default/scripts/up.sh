#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
COMPOSE_FILE="$APP_DIR/docker/compose.yaml"
HOST_PORT="${HOST_PORT:-18645}"

echo "Starting ECShop 3.6.0 with Docker Compose..."
cd "$APP_DIR"
docker compose -f "$COMPOSE_FILE" up -d

# Ensure static caches in app container are clean
docker compose -f "$COMPOSE_FILE" exec -T app rm -f /var/www/html/temp/static_caches/shop_config.php >/dev/null 2>&1 || true

echo "Waiting for ECShop to become ready on port ${HOST_PORT}..."
TIMEOUT=120
ELAPSED=0

while [ "$ELAPSED" -lt "$TIMEOUT" ]; do
    HTTP_CODE=$(curl -s -L -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/admin/" 2>/dev/null || true)
    if [ "$HTTP_CODE" = "200" ]; then
        echo "ECShop is ready (HTTP $HTTP_CODE)!"
        exit 0
    fi
    sleep 2
    ELAPSED=$((ELAPSED + 2))
done

echo "ECShop startup timed out after ${TIMEOUT}s"
docker compose -f "$COMPOSE_FILE" ps
docker compose -f "$COMPOSE_FILE" logs --tail=50
exit 1
