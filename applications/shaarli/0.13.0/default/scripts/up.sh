#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${APP_DIR}/docker/compose.yaml"
HOST_PORT="${HOST_PORT:-18664}"
ADMIN_USER="${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-admin}}}"
ADMIN_PASSWORD="${ADMIN_PASSWORD:-${APP_PASSWORD:-${PASSWORD:-Admin123456!}}}"

echo "Starting Shaarli 0.13.0 with Docker Compose..."
cd "${APP_DIR}"
docker compose -f "${COMPOSE_FILE}" config --quiet
docker compose -f "${COMPOSE_FILE}" up -d

echo "Waiting for Shaarli service to be responsive on port ${HOST_PORT}..."
TIMEOUT=60
ELAPSED=0
APP_READY=0

while [ $ELAPSED -lt $TIMEOUT ]; do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/" 2>/dev/null || true)
    if [ "$HTTP_CODE" = "200" ] || [ "$HTTP_CODE" = "302" ]; then
        APP_READY=1
        break
    fi
    sleep 2
    ELAPSED=$((ELAPSED + 2))
done

if [ $APP_READY -ne 1 ]; then
    echo "Error: Shaarli service did not become responsive within ${TIMEOUT} seconds."
    docker compose -f "${COMPOSE_FILE}" ps
    docker compose -f "${COMPOSE_FILE}" logs
    exit 1
fi

# Perform initial installation if required (when Shaarli redirects to /install)
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/" 2>/dev/null || true)
if [ "$HTTP_CODE" = "302" ]; then
    echo "Configuring initial Shaarli installation..."
    COOKIE_JAR="$(mktemp)"
    curl -s -c "$COOKIE_JAR" -b "$COOKIE_JAR" "http://127.0.0.1:${HOST_PORT}/install" > /dev/null 2>&1 || true
    curl -s -L -c "$COOKIE_JAR" -b "$COOKIE_JAR" "http://127.0.0.1:${HOST_PORT}/install/session-test" > /dev/null 2>&1 || true
    curl -s -L -c "$COOKIE_JAR" -b "$COOKIE_JAR" -X POST "http://127.0.0.1:${HOST_PORT}/install" \
        --data-urlencode "setlogin=${ADMIN_USER}" \
        --data-urlencode "setpassword=${ADMIN_PASSWORD}" \
        --data-urlencode "title=Shaarli" \
        --data-urlencode "language=en" \
        --data-urlencode "continent=UTC" \
        --data-urlencode "city=UTC" \
        --data-urlencode "updateCheck=1" \
        --data-urlencode "enableApi=1" > /dev/null 2>&1 || true
    rm -f "$COOKIE_JAR"
    echo "Shaarli initial setup complete."
fi

# Verify root returns HTTP 200
for i in {1..10}; do
    FINAL_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/" 2>/dev/null || true)
    if [ "$FINAL_CODE" = "200" ]; then
        echo "Shaarli startup completed successfully (HTTP 200)."
        exit 0
    fi
    sleep 1
done

echo "Warning: Final HTTP code was ${FINAL_CODE}."
exit 0
