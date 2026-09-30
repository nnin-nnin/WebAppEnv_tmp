#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${PROJECT_DIR}/docker/compose.yaml"
HOST_PORT="${HOST_PORT:-18652}"
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

echo "Checking Metabase health endpoint (${APP_URL}/api/health)..."
HEALTH_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/api/health" || true)
if [ "${HEALTH_STATUS}" != "200" ]; then
    echo "Error: /api/health check failed with status code ${HEALTH_STATUS}."
    exit 1
fi

echo "Checking Metabase frontend root endpoint (${APP_URL}/)..."
ROOT_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/" || true)
if [ "${ROOT_STATUS}" != "200" ]; then
    echo "Error: Root HTTP check failed with status code ${ROOT_STATUS}."
    exit 1
fi

echo "Performing login verification..."
"${PROJECT_DIR}/resources/login.sh"

echo "Healthcheck passed successfully!"
exit 0
