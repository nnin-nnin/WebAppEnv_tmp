#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18752}"
URL="http://localhost:${HOST_PORT}"

echo "Starting Chamilo with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

echo "Waiting for Chamilo to become ready..."
for i in {1..30}; do
    if curl -s -I "$URL/" >/dev/null 2>&1; then
        echo "Chamilo is ready."
        exit 0
    fi
    sleep 2
done

echo "Chamilo started."
