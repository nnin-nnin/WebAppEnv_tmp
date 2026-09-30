#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${PROJECT_DIR}/docker/compose.yaml"

echo "Checking Docker Compose configuration..."
docker compose -f "${COMPOSE_FILE}" config --quiet

echo "Starting Gitea services..."
docker compose -f "${COMPOSE_FILE}" up -d

echo "Waiting for Gitea service to become healthy..."
TIMEOUT=180
ELAPSED=0
APP_READY=0

while [ $ELAPSED -lt $TIMEOUT ]; do
    if curl -s -f http://127.0.0.1:18655/ >/dev/null 2>&1; then
        APP_READY=1
        break
    fi
    sleep 2
    ELAPSED=$((ELAPSED + 2))
done

if [ $APP_READY -ne 1 ]; then
    echo "Error: Gitea service did not become responsive within ${TIMEOUT} seconds."
    docker compose -f "${COMPOSE_FILE}" ps
    docker compose -f "${COMPOSE_FILE}" logs
    exit 1
fi

echo "Gitea HTTP endpoint is responsive."

ADMIN_USER="${ADMIN_USERNAME:-${APP_USER:-admin}}"
ADMIN_PASS="${ADMIN_PASSWORD:-${APP_PASSWORD:-Admin123456!}}"

echo "Ensuring initial administrator user '${ADMIN_USER}' is configured..."
USER_EXISTS=$(docker compose -f "${COMPOSE_FILE}" exec -T -u 1000 app sqlite3 /data/gitea/gitea.db "SELECT id FROM user WHERE lower_name='${ADMIN_USER}';" 2>/dev/null || true)

if [ -z "${USER_EXISTS}" ]; then
    echo "Creating administrator account..."
    docker compose -f "${COMPOSE_FILE}" exec -T -u 1000 app \
        gitea admin user create \
        --admin \
        --username initadmin \
        --password "${ADMIN_PASS}" \
        --email "${ADMIN_USER}@example.com" \
        --must-change-password=false >/dev/null 2>&1 || true

    docker compose -f "${COMPOSE_FILE}" exec -T -u 1000 app \
        sqlite3 /data/gitea/gitea.db "UPDATE user SET name='${ADMIN_USER}', lower_name='${ADMIN_USER}' WHERE name='initadmin';" >/dev/null 2>&1 || true
    echo "Administrator account '${ADMIN_USER}' created and configured."
else
    echo "Administrator account '${ADMIN_USER}' already exists."
fi

echo "Gitea startup completed successfully."
exit 0
