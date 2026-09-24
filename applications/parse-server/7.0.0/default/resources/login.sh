#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18558}"
APP_ID="${PARSE_SERVER_APPLICATION_ID:-parse-server}"
MASTER_KEY="${PARSE_SERVER_MASTER_KEY:-AdminPassword123!}"
USERNAME="${ADMIN_USERNAME:-${USERNAME:-${APP_USERNAME:-admin}}}"
PASSWORD="${ADMIN_PASSWORD:-${PASSWORD:-${APP_PASSWORD:-AdminPassword123!}}}"

BASE_URL="http://127.0.0.1:${HOST_PORT}"

echo "Checking Parse Server health at ${BASE_URL}/parse/health..."
HEALTH_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/parse/health" || true)

if [ "$HEALTH_STATUS" != "200" ]; then
    echo "FAILED: /parse/health returned HTTP ${HEALTH_STATUS}"
    exit 1
fi
echo "SUCCESS: Parse Server health endpoint is OK (HTTP 200)."

# Attempt login
echo "Attempting login for user '${USERNAME}'..."
LOGIN_RESP=$(curl -s -w "\n%{http_code}" -X GET "${BASE_URL}/parse/login?username=${USERNAME}&password=${PASSWORD}" \
  -H "X-Parse-Application-Id: ${APP_ID}")

HTTP_CODE=$(echo "$LOGIN_RESP" | tail -n1)
BODY=$(echo "$LOGIN_RESP" | sed '$d')

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: Login successful for user '${USERNAME}'."
    echo "$BODY"
    exit 0
fi

# If user not found (HTTP 404 or code 101), attempt to initialize the user with Master Key and retry
echo "User not yet created or login returned HTTP ${HTTP_CODE}. Attempting to provision admin user..."
curl -s -X POST "${BASE_URL}/parse/users" \
  -H "X-Parse-Application-Id: ${APP_ID}" \
  -H "X-Parse-Master-Key: ${MASTER_KEY}" \
  -H "Content-Type: application/json" \
  -d "{\"username\":\"${USERNAME}\",\"password\":\"${PASSWORD}\"}" >/dev/null 2>&1 || true

# Retry login
LOGIN_RESP=$(curl -s -w "\n%{http_code}" -X GET "${BASE_URL}/parse/login?username=${USERNAME}&password=${PASSWORD}" \
  -H "X-Parse-Application-Id: ${APP_ID}")

HTTP_CODE=$(echo "$LOGIN_RESP" | tail -n1)
BODY=$(echo "$LOGIN_RESP" | sed '$d')

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: Login successful for user '${USERNAME}' after provisioning."
    echo "$BODY"
    exit 0
else
    echo "FAILED: Login failed for user '${USERNAME}' with HTTP ${HTTP_CODE}."
    echo "$BODY"
    exit 1
fi
