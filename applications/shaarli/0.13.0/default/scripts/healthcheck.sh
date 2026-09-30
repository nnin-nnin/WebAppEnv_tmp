#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${APP_DIR}/docker/compose.yaml"
HOST_PORT="${HOST_PORT:-18664}"
URL="http://127.0.0.1:${HOST_PORT}/"
ADMIN_USER="${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-admin}}}"
ADMIN_PASSWORD="${ADMIN_PASSWORD:-${APP_PASSWORD:-${PASSWORD:-Admin123456!}}}"

echo "Checking Shaarli service health at ${URL}..."

# Check if containers are running
if ! docker compose -f "${COMPOSE_FILE}" ps --status running | grep -q "app"; then
    echo "FAILED: Shaarli container is not running."
    exit 1
fi

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${URL}" 2>/dev/null || true)

# If still 302, trigger installation as fallback
if [ "$HTTP_CODE" = "302" ]; then
    echo "Triggering initial install in healthcheck fallback..."
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
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${URL}" 2>/dev/null || true)
fi

if [ "$HTTP_CODE" = "200" ]; then
    echo "SUCCESS: Shaarli root endpoint returned HTTP 200!"
else
    echo "FAILED: Shaarli root endpoint returned HTTP ${HTTP_CODE}"
    exit 1
fi

if [ -x "${APP_DIR}/resources/login.sh" ]; then
    "${APP_DIR}/resources/login.sh"
fi

echo "Health check PASSED!"
exit 0
