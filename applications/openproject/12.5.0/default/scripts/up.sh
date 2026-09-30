#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18646}"

echo "Starting OpenProject 12.5.0 with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

echo "Containers started. Waiting for application to initialize..."
for i in {1..90}; do
    HTTP_CODE=$(curl --noproxy "*" -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/login" || true)
    if [ "$HTTP_CODE" -eq 200 ]; then
        echo "OpenProject is ready! (HTTP 200)"
        exit 0
    fi
    sleep 2
done

echo "OpenProject started, proceeding..."
