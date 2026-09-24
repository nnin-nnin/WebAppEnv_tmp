#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
COMPOSE_FILE="$APP_DIR/docker/compose.yaml"
HOST_PORT="${HOST_PORT:-18571}"

echo "Starting Backdrop CMS 1.28.1 with Docker Compose..."
cd "$APP_DIR"
docker compose -f "$COMPOSE_FILE" up -d

echo "Waiting for Backdrop CMS to become ready on port ${HOST_PORT}..."
TIMEOUT=180
ELAPSED=0
while [ $ELAPSED -lt $TIMEOUT ]; do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://localhost:${HOST_PORT}/" 2>/dev/null || true)
    if [ "$HTTP_CODE" = "200" ] || [ "$HTTP_CODE" = "302" ]; then
        echo "Backdrop CMS is ready (HTTP $HTTP_CODE)!"
        exit 0
    fi
    sleep 2
    ELAPSED=$((ELAPSED + 2))
done

echo "Error: Backdrop CMS service did not become ready within ${TIMEOUT} seconds."
docker compose -f "$COMPOSE_FILE" ps
docker compose -f "$COMPOSE_FILE" logs
exit 1
