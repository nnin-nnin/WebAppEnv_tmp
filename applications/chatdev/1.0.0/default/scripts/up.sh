#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "Starting ChatDev with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

HOST_PORT="${HOST_PORT:-18613}"
BASE_URL="http://localhost:${HOST_PORT}"

echo "Waiting for ChatDev visualizer to become ready..."
for i in $(seq 1 30); do
    if curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/" | grep -qE "^(200|301|302)$"; then
        echo "ChatDev is up and responding!"
        exit 0
    fi
    sleep 1
done

echo "ChatDev started."
