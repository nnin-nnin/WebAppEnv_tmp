#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18562}"

echo "Starting Roundcube 1.7.4 with Docker Compose..."
cd "$APP_DIR"

if [ "$(uname -m)" = "arm64" ]; then
    docker compose -f docker/compose.yaml -f <(printf 'services:\n  web:\n    platform: linux/arm64\n') up -d
else
    docker compose -f docker/compose.yaml up -d
fi

echo "Containers started. Waiting for application to initialize..."
for i in {1..30}; do
    if curl -s -o /dev/null -w "%{http_code}" "http://localhost:${HOST_PORT}/" | grep -qE "^(200|302)$"; then
        echo "Roundcube is ready!"
        exit 0
    fi
    sleep 1
done

echo "Roundcube started, proceeding..."
