#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18532}"

echo "Starting Kanboard 1.2.54 with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

echo "Containers started. Waiting for application to initialize..."
for i in {1..30}; do
    if curl -s -o /dev/null -w "%{http_code}" "http://localhost:${HOST_PORT}" | grep -qE "^(200|302)$"; then
        echo "Kanboard is ready!"
        exit 0
    fi
    sleep 1
done

echo "Kanboard started, proceeding..."
