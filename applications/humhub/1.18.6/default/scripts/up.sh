#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
COMPOSE_FILE="$APP_DIR/docker/compose.yaml"
HOST_PORT="${HOST_PORT:-18564}"

echo "Starting HumHub 1.18.6 with Docker Compose..."
cd "$APP_DIR"
docker compose -f "$COMPOSE_FILE" up -d

echo "Waiting for HumHub to become ready on port ${HOST_PORT}..."
TIMEOUT=180
ELAPSED=0
while [ $ELAPSED -lt $TIMEOUT ]; do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://localhost:${HOST_PORT}/user/auth/login" 2>/dev/null || true)
    if [ "$HTTP_CODE" = "200" ] || [ "$HTTP_CODE" = "302" ]; then
        echo "HumHub is ready (HTTP $HTTP_CODE)!"
        exit 0
    fi
    sleep 2
    ELAPSED=$((ELAPSED + 2))
done

echo "Error: HumHub service did not become ready within ${TIMEOUT} seconds."
docker compose -f "$COMPOSE_FILE" ps
docker compose -f "$COMPOSE_FILE" logs
exit 1
