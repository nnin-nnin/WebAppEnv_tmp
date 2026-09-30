#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18693}"

echo "Starting Node-RED 3.1.9 with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

echo "Waiting for Node-RED HTTP service to be ready on port ${HOST_PORT}..."
READY=0
for i in {1..60}; do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/" || true)
    if [ "$HTTP_CODE" -eq 200 ]; then
        READY=1
        break
    fi
    sleep 2
done

if [ "$READY" -ne 1 ]; then
    echo "ERROR: Node-RED service failed to respond within timeout."
    docker compose -f docker/compose.yaml logs
    exit 1
fi

echo "Node-RED startup complete on port ${HOST_PORT}."
exit 0
