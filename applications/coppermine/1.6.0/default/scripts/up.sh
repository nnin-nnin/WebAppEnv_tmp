#!/usr/bin/env bash
set -e

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
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
COMPOSE_FILE="$APP_DIR/docker/compose.yaml"
HOST_PORT="${HOST_PORT:-18632}"

echo "Starting Coppermine 1.6.0 with Docker Compose..."
cd "$APP_DIR"
docker compose -f "$COMPOSE_FILE" up -d

echo "Waiting for Coppermine web service on port ${HOST_PORT}..."
TIMEOUT=60
ELAPSED=0
while [ $ELAPSED -lt $TIMEOUT ]; do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -H "User-Agent: Mozilla/5.0" "http://localhost:${HOST_PORT}/" 2>/dev/null || true)
    if [ "$HTTP_CODE" -ge 200 ] && [ "$HTTP_CODE" -lt 400 ]; then
        echo "Coppermine 1.6.0 is ready (HTTP $HTTP_CODE)!"
        exit 0
    fi
    sleep 1
    ELAPSED=$((ELAPSED + 1))
done

echo "Error: Coppermine service did not become ready within ${TIMEOUT} seconds."
docker compose -f "$COMPOSE_FILE" ps
docker compose -f "$COMPOSE_FILE" logs
exit 1
