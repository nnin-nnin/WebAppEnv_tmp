#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18554}"

echo "Starting ProcessWire 3.0.255 with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

echo "Waiting for ProcessWire to become ready on port ${HOST_PORT}..."
for i in {1..60}; do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://localhost:${HOST_PORT}/processwire/" 2>/dev/null || true)
    if [ "$HTTP_CODE" = "200" ] || [ "$HTTP_CODE" = "302" ] || [ "$HTTP_CODE" = "303" ]; then
        echo "ProcessWire is ready (HTTP $HTTP_CODE)!"
        exit 0
    fi
    sleep 2
done

echo "ProcessWire startup wait finished, proceeding..."
