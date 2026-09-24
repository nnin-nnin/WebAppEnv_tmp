#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18566}"
BASE_URL="${BASE_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${ORANGEHRM_USERNAME:-${ADMIN_USERNAME:-${APP_USER:-${USERNAME:-Admin}}}}"
PASSWORD="${ORANGEHRM_PASSWORD:-${ADMIN_PASSWORD:-${APP_PASSWORD:-${PASSWORD:-Ohrm@1423}}}}"

COOKIE_FILE="$(mktemp /tmp/orangehrm_cookie_XXXXXX.txt)"
trap 'rm -f "$COOKIE_FILE"' EXIT

LOGIN_PAGE="${BASE_URL}/web/index.php/auth/login"
echo "Testing OrangeHRM login at ${BASE_URL} as ${USERNAME}..."

LOGIN_HTML=$(curl -s -L -c "$COOKIE_FILE" -b "$COOKIE_FILE" "$LOGIN_PAGE")

CSRF_TOKEN=$(echo "$LOGIN_HTML" | grep -o ':token="&quot;[^&]*&quot;"' | head -n 1 | sed 's/:token="&quot;//;s/&quot;"//')

if [ -z "$CSRF_TOKEN" ]; then
    CSRF_TOKEN=$(echo "$LOGIN_HTML" | grep -o ':token="[^"]*"' | head -n 1 | sed 's/:token="//;s/"//' | sed 's/&quot;//g')
fi

if [ -z "$CSRF_TOKEN" ]; then
    echo "FAILED: Could not extract CSRF token from login page"
    exit 1
fi

VALIDATE_URL="${BASE_URL}/web/index.php/auth/validate"
RESP=$(curl -s -L -c "$COOKIE_FILE" -b "$COOKIE_FILE" \
    --data-urlencode "_token=${CSRF_TOKEN}" \
    --data-urlencode "username=${USERNAME}" \
    --data-urlencode "password=${PASSWORD}" \
    "$VALIDATE_URL")

if echo "$RESP" | grep -qiE "(view-dashboard|dashboard|sidepanel-menu-items|logout)"; then
    echo "SUCCESS: OrangeHRM login successful for user '${USERNAME}'!"
    exit 0
else
    echo "FAILED: OrangeHRM login failed for user '${USERNAME}'."
    exit 1
fi
