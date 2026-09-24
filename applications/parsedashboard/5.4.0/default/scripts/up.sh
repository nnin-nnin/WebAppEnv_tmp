#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18592}"

echo "Starting Parse Dashboard 5.4.0 with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

echo "Waiting for Parse Dashboard to become ready..."
for i in {1..30}; do
    if curl -s -f "http://127.0.0.1:${HOST_PORT}/login" >/dev/null 2>&1; then
        echo "Parse Dashboard is healthy!"
        break
    fi
    sleep 1
done

echo "Environment is up and ready."
