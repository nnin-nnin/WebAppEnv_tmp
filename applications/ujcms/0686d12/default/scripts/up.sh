#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${PROJECT_DIR}/docker/compose.yaml"
APP_URL="${APP_URL:-http://localhost:18081}"

echo "Checking Docker Compose configuration..."
docker compose -f "${COMPOSE_FILE}" config --quiet

echo "Starting Docker Compose services for UJCMS..."
docker compose -f "${COMPOSE_FILE}" up -d

echo "Waiting for services to become healthy and ready..."
TIMEOUT=240
ELAPSED=0
READY=0

while [ $ELAPSED -lt $TIMEOUT ]; do
    UNHEALTHY=$(docker compose -f "${COMPOSE_FILE}" ps --format json 2>/dev/null | grep -i '"Health":"unhealthy"' || true)
    STARTING=$(docker compose -f "${COMPOSE_FILE}" ps --format json 2>/dev/null | grep -i '"Health":"starting"' || true)
    
    if [ -z "${STARTING}" ] && [ -z "${UNHEALTHY}" ]; then
        HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/" 2>/dev/null || echo "000")
        if [ "${HTTP_STATUS}" = "200" ] || [ "${HTTP_STATUS}" = "302" ]; then
            READY=1
            break
        fi
    fi
    
    sleep 3
    ELAPSED=$((ELAPSED + 3))
done

if [ $READY -ne 1 ]; then
    echo "Error: Services did not become healthy within ${TIMEOUT} seconds."
    docker compose -f "${COMPOSE_FILE}" ps
    docker compose -f "${COMPOSE_FILE}" logs
    exit 1
fi

echo "UJCMS is accessible at ${APP_URL}/ (HTTP ${HTTP_STATUS})"

echo "Checking and seeding multi-dimension evaluation accounts into database..."
# Check if user1 exists in db
USER_EXISTS=$(docker compose -f "${COMPOSE_FILE}" exec -T db mysql -uujcms -pAdminPassword123! ujcms -sse "SELECT count(*) FROM ujcms_user WHERE username_='user1';" 2>/dev/null || echo "0")

if [ "${USER_EXISTS}" = "0" ]; then
    echo "Seeding evaluation accounts (admin2, user1, user2)..."
    docker compose -f "${COMPOSE_FILE}" exec -T db mysql -uujcms -pAdminPassword123! ujcms < "${PROJECT_DIR}/resources/db/seed-users.sql"
    echo "Evaluation accounts seeded successfully."
else
    echo "Evaluation accounts already present."
fi

echo "Verifying authentication matrix..."
APP_URL="${APP_URL}" "${PROJECT_DIR}/resources/login.sh"

echo "All services are running, initialized, and verified!"
docker compose -f "${COMPOSE_FILE}" ps
exit 0
