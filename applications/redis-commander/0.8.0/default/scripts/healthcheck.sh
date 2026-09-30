#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
COMPOSE_FILE="${APP_DIR}/docker/compose.yaml"
HOST_PORT="${HOST_PORT:-18687}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-admin}}}"
PASSWORD="${ADMIN_PASSWORD:-${APP_PASSWORD:-Admin123456!}}"
URL="http://${USERNAME}:${PASSWORD}@127.0.0.1:${HOST_PORT}/"

echo "Validating Docker Compose configuration..."
docker compose -f "$COMPOSE_FILE" config --quiet

echo "Checking container status..."
RUNNING_CONTAINERS=$(docker compose -f "$COMPOSE_FILE" ps -q 2>/dev/null | wc -l | tr -d ' ')
if [ "${RUNNING_CONTAINERS}" -lt 1 ]; then
    echo "Error: Expected at least 1 running container, found ${RUNNING_CONTAINERS}."
    docker compose -f "$COMPOSE_FILE" ps
    exit 1
fi

echo "Checking Redis Commander health endpoint at ${URL}..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$URL" || true)

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: Redis Commander health endpoint returned HTTP ${HTTP_CODE}."
else
    echo "FAILED: Redis Commander health endpoint returned HTTP ${HTTP_CODE}."
    exit 1
fi

if [ -x "$APP_DIR/resources/login.sh" ]; then
    "$APP_DIR/resources/login.sh"
fi

echo "Health check PASSED!"
exit 0
