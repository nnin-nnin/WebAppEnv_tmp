#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18544}"

echo "Starting phpIPAM 1.5.0 with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

echo "Waiting for phpIPAM service to be ready..."
for i in {1..60}; do
    if curl -s -o /dev/null -w "%{http_code}" "http://localhost:${HOST_PORT}/" | grep -qE "^(200|302)$"; then
        echo "phpIPAM is ready!"
        exit 0
    fi
    sleep 1
done

echo "phpIPAM started, proceeding..."
