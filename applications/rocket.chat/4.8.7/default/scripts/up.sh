#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18647}"
URL="http://127.0.0.1:${HOST_PORT}"

echo "Starting Rocket.Chat 4.8.7 with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

echo "Waiting for Rocket.Chat service to become ready at ${URL}/..."
READY=0
for i in {1..90}; do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${URL}/" 2>/dev/null || true)
    if [ "$HTTP_CODE" = "200" ]; then
        READY=1
        break
    fi
    sleep 2
done

if [ "$READY" -ne 1 ]; then
    echo "FAILED: Rocket.Chat service failed to respond within 180s"
    docker compose -f docker/compose.yaml logs
    exit 1
fi

echo "Rocket.Chat 4.8.7 started successfully."
