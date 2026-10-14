#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
HOST_PORT="${HOST_PORT:-18083}"

echo "Starting webchess services with Docker Compose..."
cd "${APP_DIR}"

docker compose -f docker/compose.yaml up -d

echo "Waiting for webchess and database to become healthy on port ${HOST_PORT}..."
READY=false
for i in {1..50}; do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/health.php" || echo "000")
    if [ "$HTTP_CODE" -eq 200 ]; then
        READY=true
        echo "webchess is ready and database connected (HTTP ${HTTP_CODE})."
        break
    fi
    sleep 2
done

if [ "$READY" != "true" ]; then
    echo "FAILED: webchess service failed to become ready within timeout."
    docker compose -f docker/compose.yaml ps
    docker compose -f docker/compose.yaml logs --tail 50
    exit 1
fi

echo "webchess startup complete on port ${HOST_PORT}."
