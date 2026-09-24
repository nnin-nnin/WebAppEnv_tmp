#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "Starting CKAN 2.10 with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

HOST_PORT="${HOST_PORT:-18598}"
URL="http://127.0.0.1:${HOST_PORT}"

echo "Waiting for CKAN to initialize..."
READY=0
for i in {1..90}; do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${URL}/user/login" 2>/dev/null || true)
    if [ "$HTTP_CODE" = "200" ]; then
        READY=1
        break
    fi
    sleep 2
done

if [ "$READY" -ne 1 ]; then
    echo "FAILED: CKAN service failed to respond within 180s"
    docker compose -f docker/compose.yaml logs app
    exit 1
fi

echo "CKAN 2.10 started successfully."
