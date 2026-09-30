#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18651}"
BASE_URL="${BASE_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-${APP_USERNAME:-admin}}}}"
PASSWORD="${ADMIN_PASSWORD:-${APP_PASSWORD:-${PASSWORD:-benchmark-only}}}"

echo "Testing Glance login at ${BASE_URL} for user '${USERNAME}'..."

COOKIE_JAR=$(mktemp)
trap 'rm -f "$COOKIE_JAR"' EXIT

# Step 1: Check login page accessibility
LOGIN_PAGE_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/login" || true)
if [ "$LOGIN_PAGE_CODE" -ne 200 ]; then
    echo "FAILED: Glance login page not responding with HTTP 200 (got HTTP ${LOGIN_PAGE_CODE})"
    exit 1
fi

# Step 2: Perform authentication API request
AUTH_CODE=$(curl -s -c "$COOKIE_JAR" -o /dev/null -w "%{http_code}" \
    -X POST "${BASE_URL}/api/authenticate" \
    -H "Content-Type: application/json" \
    -d "{\"username\":\"${USERNAME}\",\"password\":\"${PASSWORD}\"}" || true)

if [ "$AUTH_CODE" -ne 200 ]; then
    echo "FAILED: Authentication failed with HTTP ${AUTH_CODE}"
    exit 1
fi

# Step 3: Verify authenticated access to root returns 200
HTTP_CODE=$(curl -s -b "$COOKIE_JAR" -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)
if [ "$HTTP_CODE" -ne 200 ]; then
    echo "FAILED: http://127.0.0.1:${HOST_PORT}/ with session returned HTTP ${HTTP_CODE} (expected 200)"
    exit 1
fi

AUTH_PAGE=$(curl -s -b "$COOKIE_JAR" "${BASE_URL}/")
if echo "$AUTH_PAGE" | grep -qiE "(Home|Glance|Logout)"; then
    echo "SUCCESS: http://127.0.0.1:${HOST_PORT}/ returned 200 and authenticated session is verified"
    exit 0
fi

echo "FAILED: Glance authentication verification failed"
exit 1
