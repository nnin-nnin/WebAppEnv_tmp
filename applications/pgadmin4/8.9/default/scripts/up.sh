#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18699}"

echo "Starting pgAdmin 4 8.9 with Docker Compose..."
cd "$APP_DIR"

docker compose -f docker/compose.yaml up -d

echo "Waiting for pgAdmin 4 service to be ready on port ${HOST_PORT}..."
READY=false
for i in {1..60}; do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/misc/ping" || true)
    if [ "$HTTP_CODE" -eq 200 ]; then
        READY=true
        echo "pgAdmin 4 is ready (HTTP $HTTP_CODE)."
        break
    fi
    sleep 1
done

if [ "$READY" != "true" ]; then
    echo "FAILED: pgAdmin 4 service failed to become ready within timeout."
    exit 1
fi

echo "pgAdmin 4 startup complete on port ${HOST_PORT}."
