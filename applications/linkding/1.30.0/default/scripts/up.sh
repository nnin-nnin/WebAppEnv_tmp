#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${APP_DIR}/docker/compose.yaml"
HOST_PORT="${HOST_PORT:-18694}"

echo "Starting linkding 1.30.0 with Docker Compose..."
docker compose -f "${COMPOSE_FILE}" up -d

echo "Waiting for linkding to become ready on port ${HOST_PORT}..."
for i in {1..60}; do
    HTTP_CODE=$(curl -s -L -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/login" || true)
    if [ "$HTTP_CODE" -eq 200 ]; then
        echo "linkding is ready (HTTP $HTTP_CODE)."
        exit 0
    fi
    sleep 2
done

echo "Error: linkding failed to become ready within timeout"
docker compose -f "${COMPOSE_FILE}" logs
exit 1
