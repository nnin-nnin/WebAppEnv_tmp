#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18657}"
BASE_URL="${BASE_URL:-http://127.0.0.1:${HOST_PORT}}"
ADMIN_USER="${ADMIN_USER:-${APP_USER:-admin@example.com}}"
ADMIN_PASSWORD="${ADMIN_PASSWORD:-${APP_PASSWORD:-Admin123456!}}"

echo "Checking Directus endpoints at ${BASE_URL}..."

# Step 1: Check server ping endpoint (expected HTTP 200 and 'pong')
PING_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/server/ping" || true)
if [ "$PING_CODE" -eq 200 ]; then
    echo "SUCCESS: Directus /server/ping endpoint returned HTTP ${PING_CODE}"
else
    echo "FAILED: Directus /server/ping endpoint returned HTTP ${PING_CODE}"
    exit 1
fi

PING_BODY=$(curl -s "${BASE_URL}/server/ping" || true)
if echo "$PING_BODY" | grep -qi "pong"; then
    echo "SUCCESS: Directus /server/ping response contains 'pong'"
else
    echo "FAILED: Directus /server/ping unexpected response: ${PING_BODY}"
    exit 1
fi

# Step 2: Check authentication endpoint /auth/login
echo "Checking authentication for ${ADMIN_USER}..."
LOGIN_CODE=$(curl -s -o /dev/null -w "%{http_code}" -X POST "${BASE_URL}/auth/login" \
  -H "Content-Type: application/json" \
  -d "{\"email\":\"${ADMIN_USER}\",\"password\":\"${ADMIN_PASSWORD}\"}" || true)

if [ "$LOGIN_CODE" -eq 200 ]; then
    echo "SUCCESS: Directus /auth/login endpoint returned HTTP ${LOGIN_CODE}"
else
    echo "FAILED: Directus /auth/login endpoint returned HTTP ${LOGIN_CODE}"
    exit 1
fi

echo "Directus login verification PASSED!"
exit 0
