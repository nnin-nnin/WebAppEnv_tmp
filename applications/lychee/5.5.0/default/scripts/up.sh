#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18657}"

echo "Starting Lychee 5.5.0 with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

echo "Waiting for Lychee service to be ready..."
for i in {1..60}; do
    if curl -s -L -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/" | grep -qE "^(200|302)$"; then
        echo "Lychee is ready!"
        exit 0
    fi
    sleep 2
done

echo "Timed out waiting for Lychee to be ready."
exit 1
