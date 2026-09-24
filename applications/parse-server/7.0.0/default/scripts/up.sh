#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18558}"

echo "Starting parse-server 7.0.0 with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

echo "Waiting for Parse Server to become ready..."
for i in {1..30}; do
    if curl -s -f "http://127.0.0.1:${HOST_PORT}/parse/health" >/dev/null 2>&1; then
        echo "Parse Server is healthy!"
        break
    fi
    sleep 1
done

# Initialize admin user if needed
if [ -x "$APP_DIR/resources/login.sh" ]; then
    "$APP_DIR/resources/login.sh" >/dev/null 2>&1 || true
fi

echo "Environment is up and ready."
