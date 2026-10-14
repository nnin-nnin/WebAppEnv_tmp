#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${PROJECT_DIR}/docker/compose.yaml"
APP_URL="${APP_URL:-http://127.0.0.1:18084}"

echo "Validating Docker Compose configuration..."
docker compose -f "${COMPOSE_FILE}" config --quiet

echo "Starting Docker Compose services for jshERP..."
docker compose -f "${COMPOSE_FILE}" up -d

echo "Waiting for services to become healthy and ready..."
TIMEOUT=300
ELAPSED=0
READY=0

while [ $ELAPSED -lt $TIMEOUT ]; do
    UNHEALTHY=$(docker compose -f "${COMPOSE_FILE}" ps --format json 2>/dev/null | grep -i '"Health":"unhealthy"' || true)
    STARTING=$(docker compose -f "${COMPOSE_FILE}" ps --format json 2>/dev/null | grep -i '"Health":"starting"' || true)
    
    if [ -z "${STARTING}" ] && [ -z "${UNHEALTHY}" ]; then
        HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/" 2>/dev/null || echo "000")
        if [ "${HTTP_STATUS}" = "200" ] || [ "${HTTP_STATUS}" = "302" ]; then
            # Also check if backend API /jshERP-boot is responsive
            API_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/jshERP-boot/user/randomImage" 2>/dev/null || echo "000")
            if [ "${API_STATUS}" = "200" ]; then
                READY=1
                break
            fi
        fi
    fi
    
    sleep 3
    ELAPSED=$((ELAPSED + 3))
done

if [ $READY -ne 1 ]; then
    echo "Error: Services did not become ready within ${TIMEOUT} seconds."
    docker compose -f "${COMPOSE_FILE}" ps
    docker compose -f "${COMPOSE_FILE}" logs --tail 50
    exit 1
fi

echo "jshERP frontend and backend ready at ${APP_URL} (HTTP ${HTTP_STATUS})"

echo "Verifying evaluation account matrix in database..."
USER_COUNT=$(docker compose -f "${COMPOSE_FILE}" exec -T jsh-mysql mysql -uroot -p123456 jsh_erp -sse "SELECT count(*) FROM jsh_user WHERE login_name IN ('admin', 'admin2', 'user1', 'user2');" 2>/dev/null || echo "0")

if [ "${USER_COUNT}" -lt "4" ]; then
    echo "Evaluation accounts missing (found ${USER_COUNT}/4). Seeding from resources/db/02-seed-users.sql..."
    docker compose -f "${COMPOSE_FILE}" exec -T jsh-mysql mysql -uroot -p123456 jsh_erp < "${PROJECT_DIR}/resources/db/02-seed-users.sql"
    echo "Evaluation accounts seeded."
else
    echo "All 4 evaluation accounts confirmed in database."
fi

echo "Verifying authentication matrix..."
APP_URL="${APP_URL}" "${PROJECT_DIR}/resources/login.sh"

echo "All services are running, initialized, and verified successfully!"
docker compose -f "${COMPOSE_FILE}" ps
exit 0
