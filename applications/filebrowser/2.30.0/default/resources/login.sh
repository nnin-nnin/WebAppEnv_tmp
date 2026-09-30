#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18667}"
BASE_URL="${BASE_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-${APP_USERNAME:-admin}}}}"
PASSWORD="${ADMIN_PASSWORD:-${APP_PASSWORD:-${PASSWORD:-admin}}}"

echo "Checking File Browser login page at ${BASE_URL}/login..."

HTTP_CODE=$(curl -s -L -o /dev/null -w "%{http_code}" "${BASE_URL}/login" || true)

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: File Browser login page returned HTTP 200."
else
    echo "FAILED: File Browser login page returned HTTP ${HTTP_CODE} (expected 200)."
    exit 1
fi

echo "Verifying File Browser authentication API at ${BASE_URL}/api/login for user '${USERNAME}'..."

AUTH_RESPONSE=$(curl -s -w "\n%{http_code}" \
    -X POST "${BASE_URL}/api/login" \
    -H "Content-Type: application/json" \
    -d "{\"username\":\"${USERNAME}\",\"password\":\"${PASSWORD}\"}" || true)

AUTH_CODE=$(echo "$AUTH_RESPONSE" | tail -n 1)
AUTH_BODY=$(echo "$AUTH_RESPONSE" | sed '$d')

if [ "$AUTH_CODE" -eq 200 ] && [ -n "$AUTH_BODY" ]; then
    echo "SUCCESS: File Browser authenticated successfully via API."
else
    echo "FAILED: File Browser authentication API returned HTTP ${AUTH_CODE} (expected 200)."
    exit 1
fi

echo "Login check PASSED!"
exit 0
