#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${PROJECT_DIR}/docker/compose.yaml"
APP_URL="${APP_URL:-http://localhost:18082}"

echo "Checking Docker Compose configuration..."
docker compose -f "${COMPOSE_FILE}" config --quiet

echo "Starting Docker Compose services for Gila CMS..."
docker compose -f "${COMPOSE_FILE}" up -d

echo "Waiting for services to become healthy and ready..."
TIMEOUT=180
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

    sleep 2
    ELAPSED=$((ELAPSED + 2))
done

if [ $READY -ne 1 ]; then
    echo "Error: Services did not become healthy within ${TIMEOUT} seconds."
    docker compose -f "${COMPOSE_FILE}" ps
    docker compose -f "${COMPOSE_FILE}" logs
    exit 1
fi

echo "Gila CMS is accessible at ${APP_URL}/ (HTTP ${HTTP_STATUS})"

echo "Checking evaluation account records in database..."
USER_COUNT=$(docker compose -f "${COMPOSE_FILE}" exec -T db mysql -ugila -pAdminPassword123! gila -sse "SELECT count(*) FROM user WHERE username IN ('admin2', 'user1', 'user2');" 2>/dev/null || echo "0")

if [ "${USER_COUNT}" -lt 3 ]; then
    echo "Evaluation accounts missing or incomplete (${USER_COUNT}/3). Re-applying database seed..."
    docker compose -f "${COMPOSE_FILE}" exec -T db mysql -ugila -pAdminPassword123! gila < "${PROJECT_DIR}/resources/db/database-seed.sql"
    echo "Database seed applied successfully."
else
    echo "Evaluation accounts confirmed present in database."
fi

echo "Verifying authentication matrix across all accounts..."
APP_URL="${APP_URL}" "${PROJECT_DIR}/resources/login.sh"

echo "All services are running, initialized, and verified!"
docker compose -f "${COMPOSE_FILE}" ps
exit 0
