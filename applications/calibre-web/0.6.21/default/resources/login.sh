#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18653}"
BASE_URL="${BASE_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USERNAME:-${APP_USER:-admin}}}}"
PASSWORD="${ADMIN_PASSWORD:-${APP_PASSWORD:-admin123}}"

echo "Testing Calibre-Web login at ${BASE_URL} for user '${USERNAME}'..."

# Step 1: Check login / root endpoint accessibility
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/login" || true)
if [ "$HTTP_CODE" -ne 200 ]; then
    HTTP_CODE=$(curl -s -L -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)
fi

if [ "$HTTP_CODE" -ne 200 ]; then
    echo "FAILED: Calibre-Web interface not responding with HTTP 200 (got HTTP ${HTTP_CODE})"
    exit 1
fi

echo "SUCCESS: Calibre-Web login interface returned HTTP ${HTTP_CODE}"

# Step 2: Perform authentication
COOKIE_JAR=$(mktemp)
trap 'rm -f "$COOKIE_JAR"' EXIT

CSRF_TOKEN=$(curl -s -c "$COOKIE_JAR" "${BASE_URL}/login" | grep -o 'name="csrf_token" value="[^"]*"' | head -n 1 | cut -d'"' -f4)
if [ -z "$CSRF_TOKEN" ]; then
    echo "FAILED: Could not extract CSRF token from login page"
    exit 1
fi

LOGIN_CODE=$(curl -s -L -o /dev/null -w "%{http_code}" -b "$COOKIE_JAR" -c "$COOKIE_JAR" \
    -d "csrf_token=${CSRF_TOKEN}" \
    -d "username=${USERNAME}" \
    -d "password=${PASSWORD}" \
    -d "remember_me=on" \
    "${BASE_URL}/login")

if [ "$LOGIN_CODE" -ne 200 ]; then
    echo "FAILED: http://127.0.0.1:${HOST_PORT}/login did not return HTTP 200 (got HTTP ${LOGIN_CODE})"
    exit 1
fi

AUTH_PAGE=$(curl -s -b "$COOKIE_JAR" "${BASE_URL}/admin/dbconfig")
if echo "$AUTH_PAGE" | grep -qiE "(Calibre-Web|Admin|logout|Settings)"; then
    echo "SUCCESS: http://127.0.0.1:${HOST_PORT}/login returned 200 and session is valid"
    exit 0
fi

echo "FAILED: Calibre-Web authentication verification failed"
exit 1
