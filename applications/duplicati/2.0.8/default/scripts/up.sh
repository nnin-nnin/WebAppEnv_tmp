#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
COMPOSE_FILE="${APP_DIR}/docker/compose.yaml"
HOST_PORT="${HOST_PORT:-18682}"

echo "Starting Duplicati 2.0.8 with Docker Compose..."
cd "$APP_DIR"

docker compose -f "$COMPOSE_FILE" up -d

echo "Waiting for Duplicati service to be ready on port ${HOST_PORT}..."
READY=false
for i in {1..60}; do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/ngax/index.html" || true)
    if [ "$HTTP_CODE" -eq 200 ]; then
        READY=true
        echo "Duplicati is ready (HTTP $HTTP_CODE)."
        break
    fi
    sleep 1
done

if [ "$READY" != "true" ]; then
    echo "FAILED: Duplicati service failed to become ready within timeout."
    docker compose -f "$COMPOSE_FILE" logs
    exit 1
fi

echo "Duplicati startup complete on port ${HOST_PORT}."
