#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${PROJECT_DIR}/docker/compose.yaml"
APP_URL="${APP_URL:-http://127.0.0.1:18081}"

echo "Validating Docker Compose file structure..."
docker compose -f "${COMPOSE_FILE}" config --quiet

echo "Checking running container status..."
RUNNING_CONTAINERS=$(docker compose -f "${COMPOSE_FILE}" ps -q 2>/dev/null | wc -l | tr -d ' ')

if [ "${RUNNING_CONTAINERS}" -lt 2 ]; then
    echo "Error: Expected at least 2 running containers (app and db), found ${RUNNING_CONTAINERS}."
    docker compose -f "${COMPOSE_FILE}" ps
    exit 1
fi

echo "Checking HTTP frontend endpoint (${APP_URL}/)..."
HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/")
if [ "${HTTP_STATUS}" != "200" ] && [ "${HTTP_STATUS}" != "302" ] && [ "${HTTP_STATUS}" != "303" ]; then
    echo "Error: HTTP check failed with status code ${HTTP_STATUS}."
    exit 1
fi
echo "HTTP check passed: ${APP_URL}/ returned ${HTTP_STATUS}"

echo "Checking control panel interface (${APP_URL}/cp/)..."
CP_HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/cp/")
if [ "${CP_HTTP_STATUS}" != "200" ] && [ "${CP_HTTP_STATUS}" != "302" ]; then
    echo "Error: Control panel check failed with status code ${CP_HTTP_STATUS}."
    exit 1
fi
echo "Control panel interface check passed: ${APP_URL}/cp/ returned ${CP_HTTP_STATUS}"

echo "Performing automated multi-dimension account verification..."
APP_URL="${APP_URL}" "${PROJECT_DIR}/resources/login.sh"

echo "Healthcheck passed successfully!"
exit 0
