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

echo "Validating Docker Compose configuration..."
docker compose -f "$COMPOSE_FILE" config --quiet

echo "Starting MyBB services..."
docker compose -f "$COMPOSE_FILE" up -d

HOST_PORT="${HOST_PORT:-18543}"
URL="http://${HOST:-localhost}:${HOST_PORT}"

echo "Waiting for MyBB to become ready at ${URL} (timeout: 60s)..."
MAX_ATTEMPTS=60
ATTEMPT=0

while [ $ATTEMPT -lt $MAX_ATTEMPTS ]; do
    ATTEMPT=$((ATTEMPT + 1))
    
    HTTP_CODE=$(curl --noproxy "*" --max-time 3 -s -o /dev/null -w "%{http_code}" "${URL}/" || true)
    if [ "$HTTP_CODE" -ge 200 ] && [ "$HTTP_CODE" -lt 400 ]; then
        echo "MyBB is UP and healthy (HTTP ${HTTP_CODE})!"
        docker compose -f "$COMPOSE_FILE" ps
        exit 0
    fi
    
    sleep 1
done

echo "ERROR: MyBB failed to become ready within 60 seconds."
docker compose -f "$COMPOSE_FILE" ps
docker compose -f "$COMPOSE_FILE" logs --tail 50
exit 1
