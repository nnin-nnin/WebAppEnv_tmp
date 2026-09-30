#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${PROJECT_DIR}/docker/compose.yaml"
APP_URL="${APP_URL:-http://127.0.0.1:18746}"

echo "Checking Compose configuration..."
docker compose -f "${COMPOSE_FILE}" config --quiet

echo "Checking if services are running..."
RUNNING=$(docker compose -f "${COMPOSE_FILE}" ps --services --filter "status=running")
if [ -z "$RUNNING" ]; then
    echo "No services are running."
    exit 1
fi

echo "Waiting for database and seed data..."
db_ready=0
for i in {1..36}; do
    if docker compose -f "${COMPOSE_FILE}" ps | grep -q "healthy"; then
        if docker compose -f "${COMPOSE_FILE}" exec -T db mysql -ucollabtive -pcollabtive collabtive -e "SELECT ID FROM user WHERE name='admin';" >/dev/null 2>&1; then
            db_ready=1
            break
        fi
    fi
    sleep 2
done

if [ "$db_ready" -ne 1 ]; then
    echo "Database or seed data verification failed."
    exit 1
fi

echo "Checking application HTTP endpoint at ${APP_URL}..."
http_ready=0
for i in {1..30}; do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/index.php" || true)
    if [ "$HTTP_CODE" -eq 200 ] || [ "$HTTP_CODE" -eq 302 ]; then
        http_ready=1
        break
    fi
    sleep 2
done

if [ "$http_ready" -ne 1 ]; then
    echo "Application HTTP endpoint check failed."
    exit 1
fi

echo "Healthcheck passed successfully."
exit 0
