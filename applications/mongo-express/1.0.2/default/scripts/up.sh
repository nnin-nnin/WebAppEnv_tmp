#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18688}"
ADMIN_USER="${APP_USER:-admin}"
ADMIN_PASS="${APP_PASSWORD:-pass}"

echo "Starting Mongo Express 1.0.2 with Docker Compose..."
cd "$APP_DIR"

docker compose -f docker/compose.yaml up -d

echo "Waiting for Mongo Express service to be ready on port ${HOST_PORT}..."
for i in {1..60}; do
    HTTP_CODE=$(curl -s -L -o /dev/null -w "%{http_code}" "http://${ADMIN_USER}:${ADMIN_PASS}@127.0.0.1:${HOST_PORT}/" || true)
    if [ "$HTTP_CODE" -eq 200 ]; then
        echo "Mongo Express is ready (HTTP $HTTP_CODE)."
        break
    fi
    sleep 1
done

echo "Mongo Express startup complete on port ${HOST_PORT}."
