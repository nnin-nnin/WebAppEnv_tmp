#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${PROJECT_DIR}/docker/compose.yaml"
APP_URL="${APP_URL:-http://127.0.0.1:18655}"

echo "Validating Docker Compose configuration..."
docker compose -f "${COMPOSE_FILE}" config --quiet

echo "Checking container status..."
RUNNING_CONTAINERS=$(docker compose -f "${COMPOSE_FILE}" ps -q 2>/dev/null | wc -l | tr -d ' ')
if [ "${RUNNING_CONTAINERS}" -lt 1 ]; then
    echo "Error: Expected at least 1 running container, found ${RUNNING_CONTAINERS}."
    docker compose -f "${COMPOSE_FILE}" ps
    exit 1
fi

echo "Checking HTTP endpoints..."
HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/" 2>/dev/null || true)
if [ "${HTTP_STATUS}" != "200" ] && [ "${HTTP_STATUS}" != "302" ] && [ "${HTTP_STATUS}" != "303" ]; then
    echo "Error: Root HTTP check failed with status ${HTTP_STATUS}."
    exit 1
fi

LOGIN_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/user/login" 2>/dev/null || true)
if [ "${LOGIN_STATUS}" != "200" ]; then
    echo "Error: Login page HTTP check failed with status ${LOGIN_STATUS}."
    exit 1
fi

echo "Performing login verification..."
"${PROJECT_DIR}/resources/login.sh" "admin" "Admin123456!"

echo "Healthcheck passed successfully!"
exit 0
