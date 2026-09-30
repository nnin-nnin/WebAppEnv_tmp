#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${PROJECT_DIR}/docker/compose.yaml"
HOST_PORT="${HOST_PORT:-18651}"
APP_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"

echo "Validating Docker Compose file structure..."
docker compose -f "${COMPOSE_FILE}" config --quiet

echo "Checking container status..."
RUNNING_CONTAINERS=$(docker compose -f "${COMPOSE_FILE}" ps -q 2>/dev/null | wc -l | tr -d ' ')
if [ "${RUNNING_CONTAINERS}" -lt 1 ]; then
    echo "Error: Expected at least 1 running container, found ${RUNNING_CONTAINERS}."
    docker compose -f "${COMPOSE_FILE}" ps
    exit 1
fi

echo "Checking Vaultwarden /alive endpoint (${APP_URL}/alive)..."
ALIVE_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/alive")
if [ "${ALIVE_STATUS}" != "200" ]; then
    echo "Error: /alive check failed with status code ${ALIVE_STATUS}."
    exit 1
fi

echo "Checking Web Vault frontend endpoint (${APP_URL}/)..."
ROOT_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/")
if [ "${ROOT_STATUS}" != "200" ]; then
    echo "Error: HTTP check failed with status code ${ROOT_STATUS}."
    exit 1
fi

echo "Performing automated login test..."
"${PROJECT_DIR}/resources/login.sh"

echo "Healthcheck passed successfully!"
exit 0
