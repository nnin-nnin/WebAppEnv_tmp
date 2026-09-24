#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "Starting Redash 10.0.0 with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

HOST_PORT="${HOST_PORT:-18610}"
URL="http://127.0.0.1:${HOST_PORT}"

echo "Waiting for Redash to initialize..."
READY=0
for i in {1..90}; do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${URL}/login" 2>/dev/null || true)
    if [ "$HTTP_CODE" = "200" ]; then
        READY=1
        break
    fi
    sleep 2
done

if [ "$READY" -ne 1 ]; then
    echo "FAILED: Redash service failed to respond within 180s"
    docker compose -f docker/compose.yaml logs server
    exit 1
fi

echo "Redash 10.0.0 started successfully."
