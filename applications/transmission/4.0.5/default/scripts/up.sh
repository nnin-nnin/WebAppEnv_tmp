#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
COMPOSE_FILE="${APP_DIR}/docker/compose.yaml"
HOST_PORT="${HOST_PORT:-18680}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-admin}}}"
PASSWORD="${ADMIN_PASSWORD:-${APP_PASSWORD:-Admin123456!}}"

echo "Starting Transmission 4.0.5 with Docker Compose..."
cd "$APP_DIR"

docker compose -f "$COMPOSE_FILE" up -d

echo "Waiting for Transmission service to be ready on port ${HOST_PORT}..."
READY=false
for i in {1..30}; do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://${USERNAME}:${PASSWORD}@127.0.0.1:${HOST_PORT}/transmission/web/" || true)
    if [ "$HTTP_CODE" -eq 200 ] || [ "$HTTP_CODE" -eq 301 ]; then
        READY=true
        echo "Transmission is ready (HTTP $HTTP_CODE)."
        break
    fi
    sleep 1
done

if [ "$READY" != "true" ]; then
    echo "FAILED: Transmission service failed to become ready within timeout."
    docker compose -f "$COMPOSE_FILE" logs
    exit 1
fi

echo "Transmission startup complete on port ${HOST_PORT}."
