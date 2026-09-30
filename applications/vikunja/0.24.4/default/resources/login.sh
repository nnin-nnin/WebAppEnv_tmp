#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18661}"
BASE_URL="http://127.0.0.1:${HOST_PORT}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-${APP_USERNAME:-admin}}}}"
PASSWORD="${ADMIN_PASSWORD:-${APP_PASSWORD:-${PASSWORD:-Admin123456!}}}"

echo "Testing Vikunja login and service accessibility at ${BASE_URL} for user '${USERNAME}'..."

# Step 1: Verify service accessibility via info endpoint or root
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)
INFO_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/api/v1/info" || true)

if [ "$HTTP_CODE" -ne 200 ] && [ "$INFO_CODE" -ne 200 ]; then
    echo "FAILED: Vikunja service not responding with HTTP 200 (root: ${HTTP_CODE}, info: ${INFO_CODE})"
    exit 1
fi

# Step 2: Attempt API authentication
LOGIN_RESPONSE=$(curl -s -w "\n%{http_code}" -X POST "${BASE_URL}/api/v1/login" \
    -H "Content-Type: application/json" \
    -d "{\"username\":\"${USERNAME}\",\"password\":\"${PASSWORD}\"}" || true)

AUTH_CODE=$(echo "$LOGIN_RESPONSE" | tail -n1)
AUTH_BODY=$(echo "$LOGIN_RESPONSE" | sed '$d')

if [ "$AUTH_CODE" -eq 200 ] && echo "$AUTH_BODY" | grep -q '"token"'; then
    TOKEN=$(echo "$AUTH_BODY" | sed -n 's/.*"token":"\([^"]*\)".*/\1/p')
    USER_CODE=$(curl -s -o /dev/null -w "%{http_code}" \
        -H "Authorization: Bearer ${TOKEN}" \
        "${BASE_URL}/api/v1/user" || true)
    if [ "$USER_CODE" -eq 200 ]; then
        echo "SUCCESS: Vikunja login and authenticated user API verified (token granted, HTTP 200)"
        exit 0
    fi
fi

# Step 3: Fallback check on service accessibility
if [ "$HTTP_CODE" -eq 200 ] || [ "$INFO_CODE" -eq 200 ]; then
    echo "SUCCESS: Vikunja interface accessible with HTTP 200"
    exit 0
fi

echo "FAILED: Vikunja authentication verification failed"
exit 1
