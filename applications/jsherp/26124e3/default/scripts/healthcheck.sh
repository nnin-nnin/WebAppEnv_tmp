#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${PROJECT_DIR}/docker/compose.yaml"
APP_URL="${APP_URL:-http://127.0.0.1:18084}"

echo "Validating Docker Compose file structure..."
docker compose -f "${COMPOSE_FILE}" config --quiet

echo "Checking running container status..."
RUNNING_CONTAINERS=$(docker compose -f "${COMPOSE_FILE}" ps -q 2>/dev/null | wc -l | tr -d ' ')

if [ "${RUNNING_CONTAINERS}" -lt 3 ]; then
    echo "Error: Expected at least 3 running containers (app, jsh-mysql, jsh-redis), found ${RUNNING_CONTAINERS}."
    docker compose -f "${COMPOSE_FILE}" ps
    exit 1
fi

echo "Checking HTTP frontend endpoint (${APP_URL}/)..."
HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/")
if [ "${HTTP_STATUS}" != "200" ] && [ "${HTTP_STATUS}" != "302" ] && [ "${HTTP_STATUS}" != "303" ]; then
    echo "Error: HTTP frontend check failed with status code ${HTTP_STATUS}."
    exit 1
fi
echo "HTTP check passed: ${APP_URL}/ returned ${HTTP_STATUS}"

echo "Checking backend service API endpoint (${APP_URL}/jshERP-boot/user/randomImage)..."
API_HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/jshERP-boot/user/randomImage")
if [ "${API_HTTP_STATUS}" != "200" ]; then
    echo "Error: Backend API check failed with status code ${API_HTTP_STATUS}."
    exit 1
fi
echo "Backend API check passed: ${APP_URL}/jshERP-boot/user/randomImage returned ${API_HTTP_STATUS}"

echo "Performing automated multi-dimension account verification..."
APP_URL="${APP_URL}" "${PROJECT_DIR}/resources/login.sh"

echo "Healthcheck passed successfully!"
exit 0
