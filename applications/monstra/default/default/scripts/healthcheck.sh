#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${PROJECT_DIR}/docker/compose.yaml"
HOST_PORT="${HOST_PORT:-18845}"
APP_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"

echo "Validating Docker Compose configuration..."
docker compose -f "${COMPOSE_FILE}" config --quiet

echo "Checking running container status..."
RUNNING_CONTAINERS=$(docker compose -f "${COMPOSE_FILE}" ps -q 2>/dev/null | wc -l | tr -d ' ')
if [ "${RUNNING_CONTAINERS}" -lt 1 ]; then
    echo "Error: No running containers found for Monstra CMS."
    docker compose -f "${COMPOSE_FILE}" ps
    exit 1
fi

echo "Checking HTTP frontend (${APP_URL}/)..."
HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/")
if [ "${HTTP_STATUS}" != "200" ] && [ "${HTTP_STATUS}" != "302" ]; then
    echo "Error: Frontend HTTP check failed with status code ${HTTP_STATUS}."
    exit 1
fi
echo "Frontend check passed: ${APP_URL}/ returned ${HTTP_STATUS}"

echo "Checking admin portal (${APP_URL}/admin/)..."
ADMIN_HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/admin/")
if [ "${ADMIN_HTTP_STATUS}" != "200" ] && [ "${ADMIN_HTTP_STATUS}" != "302" ]; then
    echo "Error: Admin interface check failed with status code ${ADMIN_HTTP_STATUS}."
    exit 1
fi
echo "Admin interface reachable: ${APP_URL}/admin/ returned ${ADMIN_HTTP_STATUS}"

echo "Executing administrator login verification..."
"${PROJECT_DIR}/resources/login.sh" "admin" "AdminPassword123!"

echo "Health check PASSED successfully!"
exit 0
