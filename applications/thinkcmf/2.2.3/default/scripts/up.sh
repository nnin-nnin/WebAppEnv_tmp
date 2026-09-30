#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18761}"

echo "Starting ThinkCMF 2.2.3 with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

echo "Waiting for ThinkCMF to initialize..."
for i in {1..60}; do
    if curl -s -f "http://127.0.0.1:${HOST_PORT}/" >/dev/null 2>&1; then
        echo "ThinkCMF service is ready."
        break
    fi
    sleep 2
done

echo "ThinkCMF startup complete on port ${HOST_PORT}."
