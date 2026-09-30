#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18740}"
BASE_URL="http://127.0.0.1:${HOST_PORT}"
ADMIN_USER="${ADMIN_USER:-${ADMIN_USERNAME:-admin}}"
ADMIN_EMAIL="${ADMIN_EMAIL:-admin@example.com}"
ADMIN_PASSWORD="${ADMIN_PASSWORD:-benchmark-only}"

echo "Checking Kirby service accessibility at ${BASE_URL}/..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/")

if [ "$HTTP_CODE" -ne 200 ]; then
    echo "FAILED: Kirby root endpoint returned HTTP $HTTP_CODE (expected 200)"
    exit 1
fi

echo "SUCCESS: Kirby root endpoint returned HTTP $HTTP_CODE"

echo "Verifying Kirby authentication for ${ADMIN_USER} (${ADMIN_EMAIL})..."
AUTH_CODE=$(curl -s -o /dev/null -w "%{http_code}" -u "${ADMIN_EMAIL}:${ADMIN_PASSWORD}" "${BASE_URL}/api/users/${ADMIN_EMAIL}")

if [ "$AUTH_CODE" -eq 200 ]; then
    echo "SUCCESS: Admin authenticated via API (HTTP 200)"
else
    echo "FAILED: Admin authentication returned HTTP $AUTH_CODE"
    exit 1
fi

echo "Login check PASSED!"
exit 0
