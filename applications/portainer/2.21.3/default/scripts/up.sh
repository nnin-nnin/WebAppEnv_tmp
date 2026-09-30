#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18655}"

echo "Starting Portainer 2.21.3 with Docker Compose..."
cd "$APP_DIR"

docker compose -f docker/compose.yaml up -d

echo "Waiting for Portainer service to be ready..."
for i in {1..60}; do
    STATUS_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/api/status" || true)
    if [ "$STATUS_CODE" -eq 200 ]; then
        echo "Portainer API is ready (HTTP $STATUS_CODE)."
        break
    fi
    ROOT_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/" || true)
    if [ "$ROOT_CODE" -eq 200 ]; then
        echo "Portainer root is ready (HTTP $ROOT_CODE)."
        break
    fi
    sleep 2
done

echo "Portainer startup complete on port ${HOST_PORT}."
