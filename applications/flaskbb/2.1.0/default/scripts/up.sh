#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18642}"

echo "Starting FlaskBB 2.1.0 with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

echo "Waiting for FlaskBB service to be ready on port ${HOST_PORT}..."
for i in $(seq 1 60); do
    if curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/" | grep -qE "^(200|301|302)$"; then
        echo "FlaskBB service responded with HTTP 200/30x."
        break
    fi
    sleep 2
done

echo "FlaskBB startup complete on port ${HOST_PORT}."
