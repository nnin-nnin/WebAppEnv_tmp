#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18758}"

echo "Starting cpg 1.6.0 with Docker Compose..."
cd "$APP_DIR"

docker compose -f docker/compose.yaml up -d

echo "Waiting for cpg service to be ready on port ${HOST_PORT}..."
for i in {1..60}; do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/v3/currencies/" || true)
    if [ "$HTTP_CODE" -eq 200 ]; then
        echo "cpg is ready (HTTP $HTTP_CODE)."
        break
    fi
    sleep 1
done

echo "cpg startup complete on port ${HOST_PORT}."
