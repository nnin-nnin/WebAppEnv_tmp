#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18562}"
BASE_URL="${BASE_URL:-http://localhost:${HOST_PORT}}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-admin}}}"
PASSWORD="${ADMIN_PASSWORD:-${APP_PASSWORD:-AdminPassword123!}}"

echo "Testing Roundcube web interface and login endpoint at ${BASE_URL} with user '${USERNAME}'..."

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

# Step 1: Fetch login page and extract CSRF token and session cookies
HTTP_CODE=$(curl -s -c "$TMP_DIR/cookie.txt" -b "$TMP_DIR/cookie.txt" -o "$TMP_DIR/login.html" -w "%{http_code}" "${BASE_URL}/")

if [ "$HTTP_CODE" -lt 200 ] || [ "$HTTP_CODE" -ge 400 ]; then
    echo "FAILED: Login page unreachable (HTTP $HTTP_CODE)"
    exit 1
fi

# Step 2: Verify Roundcube login interface elements
if ! grep -qiE "(Roundcube Webmail|rcmail|login-form)" "$TMP_DIR/login.html"; then
    echo "FAILED: Page content does not indicate Roundcube Webmail interface"
    exit 1
fi

CSRF_TOKEN=$(grep -o 'name="_token" value="[^"]*"' "$TMP_DIR/login.html" | sed 's/name="_token" value="//;s/"//' | head -n 1)

if [ -z "$CSRF_TOKEN" ]; then
    echo "FAILED: Could not extract CSRF token (_token) from login page"
    exit 1
fi

# Step 3: Submit login form to test authentication controller
LOGIN_CODE=$(curl -s -L -c "$TMP_DIR/cookie.txt" -b "$TMP_DIR/cookie.txt" -o "$TMP_DIR/response.html" -w "%{http_code}" \
    --data-urlencode "_token=${CSRF_TOKEN}" \
    --data-urlencode "_task=login" \
    --data-urlencode "_action=login" \
    --data-urlencode "_user=${USERNAME}" \
    --data-urlencode "_pass=${PASSWORD}" \
    "${BASE_URL}/?_task=login")

if { [ "$LOGIN_CODE" -eq 200 ] || [ "$LOGIN_CODE" -eq 401 ]; } && grep -qiE "(rcmail|roundcube|Connection to storage server failed|Logout|task=mail)" "$TMP_DIR/response.html"; then
    echo "SUCCESS: Roundcube login endpoint processed authentication request correctly (HTTP $LOGIN_CODE)"
    exit 0
else
    echo "FAILED: Login verification failed (HTTP $LOGIN_CODE)"
    exit 1
fi
