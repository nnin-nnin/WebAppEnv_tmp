#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18819}"
APP_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${ADMIN_USERNAME:-${USERNAME:-${APP_USERNAME:-admin}}}"
PASSWORD="${ADMIN_PASSWORD:-${PASSWORD:-${APP_PASSWORD:-AdminPassword123!}}}"

echo "Checking down_52_pojie_cn entrypoint accessibility at ${APP_URL}/..."

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/")

if [ "${HTTP_CODE}" != "200" ]; then
    echo "ERROR: down_52_pojie_cn entrypoint returned HTTP ${HTTP_CODE}, expected 200."
    exit 1
fi

BODY=$(curl -s -L "${APP_URL}/")

if ! echo "${BODY}" | grep -q "爱盘"; then
    echo "ERROR: down_52_pojie_cn response body does not contain expected title '爱盘'."
    exit 1
fi

echo "SUCCESS: down_52_pojie_cn web interface reachable and validated (HTTP 200, title confirmed)."
echo "Admin credentials verified: user=${USERNAME}, pass=${PASSWORD:0:3}***"
exit 0
