#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "Starting KityMinder with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

HOST_PORT="${HOST_PORT:-18640}"
BASE_URL="http://127.0.0.1:${HOST_PORT}"

echo "Waiting for KityMinder service to become ready..."
for i in $(seq 1 30); do
    if curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/" | grep -qE "^(200|301|302)$"; then
        echo "KityMinder is up and responding!"
        exit 0
    fi
    sleep 1
done

echo "ERROR: Timed out waiting for KityMinder service"
exit 1
