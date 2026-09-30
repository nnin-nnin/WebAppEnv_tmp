#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
COMPOSE_FILE="${APP_DIR}/docker/compose.yaml"
HOST_PORT="${HOST_PORT:-18677}"

echo "Starting Syncthing 1.27.12 with Docker Compose..."
cd "$APP_DIR"

docker compose -f "$COMPOSE_FILE" up -d

echo "Waiting for Syncthing service to be ready on port ${HOST_PORT}..."
READY=false
for i in {1..30}; do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/rest/noauth/health" || true)
    if [ "$HTTP_CODE" -eq 200 ]; then
        READY=true
        echo "Syncthing is ready (HTTP $HTTP_CODE)."
        break
    fi
    sleep 1
done

if [ "$READY" != "true" ]; then
    echo "FAILED: Syncthing service failed to become ready within timeout."
    docker compose -f "$COMPOSE_FILE" logs
    exit 1
fi

ADMIN_USER="${ADMIN_USER:-${ADMIN_USERNAME:-${APP_USER:-admin}}}"
ADMIN_PASSWORD="${ADMIN_PASSWORD:-${APP_PASSWORD:-Admin123456!}}"
API_KEY="${API_KEY:-AdminApiKey123456}"

echo "Configuring Syncthing initial credentials..."
docker compose -f "$COMPOSE_FILE" exec -T app /bin/syncthing cli config gui user set "$ADMIN_USER"
docker compose -f "$COMPOSE_FILE" exec -T app /bin/syncthing cli config gui password set "$ADMIN_PASSWORD"
docker compose -f "$COMPOSE_FILE" exec -T app /bin/syncthing cli config gui apikey set "$API_KEY"

echo "Syncthing startup complete on port ${HOST_PORT}."
