#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18552}"

echo "Starting Seo Panel 6.0.0 with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

echo "Waiting for Seo Panel to become ready on port ${HOST_PORT}..."
for i in {1..60}; do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://localhost:${HOST_PORT}/login.php" 2>/dev/null || true)
    if [ "$HTTP_CODE" = "200" ] || [ "$HTTP_CODE" = "302" ] || [ "$HTTP_CODE" = "303" ]; then
        echo "Seo Panel is ready (HTTP $HTTP_CODE)!"
        exit 0
    fi
    sleep 2
done

echo "Timeout waiting for Seo Panel to become ready"
exit 1
