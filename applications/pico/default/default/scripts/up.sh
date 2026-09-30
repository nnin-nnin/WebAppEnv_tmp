#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18856}"

echo "Starting Pico CMS with Docker Compose..."
cd "$APP_DIR"

docker compose -f docker/compose.yaml up -d

echo "Waiting for Pico service to be ready on port ${HOST_PORT}..."
READY=false
for i in {1..30}; do
    HTTP_CODE=$(curl -s -L -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/" || true)
    if [ "$HTTP_CODE" -eq 200 ]; then
        READY=true
        echo "Pico is ready (HTTP $HTTP_CODE)."
        break
    fi
    sleep 1
done

if [ "$READY" != "true" ]; then
    echo "FAILED: Pico service failed to become ready within timeout."
    exit 1
fi

echo "Pico startup complete on port ${HOST_PORT}."
