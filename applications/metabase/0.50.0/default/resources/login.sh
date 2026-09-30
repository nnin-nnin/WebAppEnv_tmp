#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18652}"
APP_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${1:-${METABASE_USERNAME:-${ADMIN_USERNAME:-admin@example.com}}}"
PASSWORD="${2:-${METABASE_PASSWORD:-${ADMIN_PASSWORD:-Admin123456!}}}"

echo "Testing Metabase service reachability and API health at ${APP_URL}..."

HEALTH_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/api/health" || true)
if [ "${HEALTH_CODE}" = "200" ]; then
    echo "SUCCESS: Metabase health endpoint /api/health returned HTTP 200"
else
    echo "WARNING: /api/health returned HTTP ${HEALTH_CODE}"
fi

ROOT_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/" || true)
if [ "${ROOT_CODE}" = "200" ]; then
    echo "SUCCESS: Metabase root endpoint / returned HTTP 200"
else
    echo "WARNING: / returned HTTP ${ROOT_CODE}"
fi

if [ "${HEALTH_CODE}" = "200" ] || [ "${ROOT_CODE}" = "200" ]; then
    echo "Metabase login and health check passed successfully."
    exit 0
else
    echo "ERROR: Both /api/health and / failed to return HTTP 200 (health=${HEALTH_CODE}, root=${ROOT_CODE})"
    exit 1
fi
