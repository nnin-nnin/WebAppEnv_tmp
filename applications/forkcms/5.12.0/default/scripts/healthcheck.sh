#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${PROJECT_DIR}/docker/compose.yaml"
HOST_PORT="${HOST_PORT:-18542}"
APP_URL="${APP_URL:-http://localhost:${HOST_PORT}}"

echo "Validating Docker Compose file structure..."
docker compose -f "${COMPOSE_FILE}" config --quiet

echo "Checking container status..."
RUNNING_CONTAINERS=$(docker compose -f "${COMPOSE_FILE}" ps -q 2>/dev/null | wc -l | tr -d ' ')
if [ "${RUNNING_CONTAINERS}" -lt 1 ]; then
    echo "Error: Expected running containers, found ${RUNNING_CONTAINERS}."
    docker compose -f "${COMPOSE_FILE}" ps
    exit 1
fi

echo "Checking HTTP endpoint (${APP_URL})..."
HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/")
if [ "${HTTP_STATUS}" != "200" ] && [ "${HTTP_STATUS}" != "302" ] && [ "${HTTP_STATUS}" != "303" ]; then
    echo "Error: HTTP check failed with status code ${HTTP_STATUS}."
    exit 1
fi

echo "Checking login page..."
LOGIN_PAGE=$(curl -s -L "${APP_URL}/private")
if ! echo "${LOGIN_PAGE}" | grep -qiE "(Fork CMS|Authentication|login)"; then
    echo "Error: Login page content check failed."
    exit 1
fi

echo "Performing automated login test..."
"${PROJECT_DIR}/resources/login.sh"

echo "Healthcheck passed successfully!"
exit 0
