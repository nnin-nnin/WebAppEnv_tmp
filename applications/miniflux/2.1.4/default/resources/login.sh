#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18653}"
BASE_URL="${BASE_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-${USER:-admin}}}}"
PASSWORD="${ADMIN_PASSWORD:-${APP_PASSWORD:-${PASSWORD:-Admin123456!}}}"

echo "Testing Miniflux login at ${BASE_URL} for user '${USERNAME}'..."

COOKIE_JAR=$(mktemp)
trap 'rm -f "$COOKIE_JAR"' EXIT

# Step 1: Check root/login page accessibility
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)
if [ "$HTTP_CODE" -ne 200 ]; then
    echo "FAILED: Miniflux web interface not responding with HTTP 200 (got HTTP ${HTTP_CODE})"
    exit 1
fi

# Step 2: Extract CSRF token
CSRF_TOKEN=$(curl -s -c "$COOKIE_JAR" "${BASE_URL}/" | grep -o 'name="csrf" value="[^"]*"' | head -n 1 | cut -d'"' -f4)
if [ -z "$CSRF_TOKEN" ]; then
    echo "FAILED: Could not extract CSRF token from login page"
    exit 1
fi

# Step 3: Perform login POST request to /login with -L to follow redirect
LOGIN_CODE=$(curl -s -L -o /dev/null -w "%{http_code}" -b "$COOKIE_JAR" -c "$COOKIE_JAR" \
    -d "csrf=${CSRF_TOKEN}" \
    -d "username=${USERNAME}" \
    -d "password=${PASSWORD}" \
    "${BASE_URL}/login")

if [ "$LOGIN_CODE" -ne 200 ]; then
    echo "FAILED: http://127.0.0.1:${HOST_PORT}/login did not return HTTP 200 (got HTTP ${LOGIN_CODE})"
    exit 1
fi

# Step 4: Validate authenticated session
AUTH_PAGE=$(curl -s -b "$COOKIE_JAR" "${BASE_URL}/unread")
if echo "$AUTH_PAGE" | grep -qiE "(Unread|Miniflux|unread-entries)"; then
    echo "SUCCESS: http://127.0.0.1:${HOST_PORT}/login returned 200 and session is valid"
    exit 0
fi

echo "FAILED: Miniflux authentication verification failed"
exit 1
