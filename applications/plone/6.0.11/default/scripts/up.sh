#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18575}"

echo "Starting Plone 6.0.11 with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

echo "Waiting for Plone service to be ready..."
for i in {1..90}; do
    if curl -s -o /dev/null -w "%{http_code}" "http://localhost:${HOST_PORT}/Plone" | grep -qE "^(200)$"; then
        echo "Plone service is ready."
        break
    fi
    sleep 2
done

echo "Plone startup complete on port ${HOST_PORT}."
