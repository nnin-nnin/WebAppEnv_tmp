#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18671}"
BASE_URL="${BASE_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-${WALLABAG_USER:-${WALLABAG_USERNAME:-wallabag}}}}}"
PASSWORD="${ADMIN_PASSWORD:-${APP_PASSWORD:-${WALLABAG_PASSWORD:-wallabag}}}"

echo "Testing wallabag login at ${BASE_URL} for user '${USERNAME}'..."

COOKIE_JAR=$(mktemp)
trap 'rm -f "$COOKIE_JAR"' EXIT

# Step 1: Check login page accessibility (must return HTTP 200)
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/login" || true)
if [ "$HTTP_CODE" -ne 200 ]; then
    echo "FAILED: http://127.0.0.1:${HOST_PORT}/login did not return HTTP 200 (got HTTP ${HTTP_CODE})"
    exit 1
fi
echo "SUCCESS: http://127.0.0.1:${HOST_PORT}/login returned HTTP 200"

# Step 2: Extract CSRF token from /login
CSRF_TOKEN=$(curl -s -c "$COOKIE_JAR" "${BASE_URL}/login" | grep -o 'name="_csrf_token" value="[^"]*"' | head -n 1 | cut -d'"' -f4)
if [ -z "$CSRF_TOKEN" ]; then
    echo "FAILED: Could not extract CSRF token from login page"
    exit 1
fi

# Step 3: Perform login POST request to /login_check with -L to follow redirect
LOGIN_CODE=$(curl -s -L -o /dev/null -w "%{http_code}" -b "$COOKIE_JAR" -c "$COOKIE_JAR" \
    -d "_csrf_token=${CSRF_TOKEN}" \
    -d "_username=${USERNAME}" \
    -d "_password=${PASSWORD}" \
    "${BASE_URL}/login_check")

if [ "$LOGIN_CODE" -ne 200 ]; then
    echo "FAILED: Authentication failed (got HTTP ${LOGIN_CODE})"
    exit 1
fi

# Step 4: Validate authenticated session
AUTH_PAGE=$(curl -sL -b "$COOKIE_JAR" "${BASE_URL}/")
if echo "$AUTH_PAGE" | grep -qiE "(logout|unread|quickstart|wallabag)"; then
    echo "SUCCESS: wallabag login verified and session is valid"
    exit 0
fi

echo "FAILED: wallabag authentication verification failed"
exit 1
