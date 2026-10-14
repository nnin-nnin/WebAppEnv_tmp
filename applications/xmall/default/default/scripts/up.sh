#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
HOST_PORT="${HOST_PORT:-18085}"

echo "Starting XMall services with Docker Compose..."
cd "${APP_DIR}"

docker compose -f docker/compose.yaml up -d

echo "Waiting for XMall, MySQL, and Redis to become healthy on port ${HOST_PORT}..."
READY=false
for i in {1..60}; do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/" || echo "000")
    if [ "$HTTP_CODE" -eq 200 ] || [ "$HTTP_CODE" -eq 302 ]; then
        READY=true
        echo "XMall is ready and accessible (HTTP ${HTTP_CODE})."
        break
    fi
    sleep 3
done

if [ "$READY" != "true" ]; then
    echo "FAILED: XMall service failed to become ready within timeout."
    docker compose -f docker/compose.yaml ps
    docker compose -f docker/compose.yaml logs --tail 50
    exit 1
fi

echo "XMall startup complete on port ${HOST_PORT}."
