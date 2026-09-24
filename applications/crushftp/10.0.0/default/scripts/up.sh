#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18634}"

echo "Starting CrushFTP 10.0.0 with Docker Compose..."
cd "$APP_DIR"
docker compose -f docker/compose.yaml up -d

echo "Waiting for CrushFTP service to be ready..."
for i in {1..30}; do
    HTTP_CODE=$(curl -s -H "Connection: close" --max-time 5 -o /dev/null -w "%{http_code}" "http://localhost:${HOST_PORT}/WebInterface/login.html" || true)
    if [ "$HTTP_CODE" -eq 200 ]; then
        echo "CrushFTP service is ready."
        break
    fi
    sleep 2
done

echo "CrushFTP startup complete on port ${HOST_PORT}."
