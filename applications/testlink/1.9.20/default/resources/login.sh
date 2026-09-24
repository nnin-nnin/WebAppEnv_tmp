#!/usr/bin/env bash
set -euo pipefail

APP_URL="${APP_URL:-http://127.0.0.1:18601}"
USERNAME="${TESTLINK_USER:-${ADMIN_USERNAME:-${APP_USER:-admin}}}"
PASSWORD="${TESTLINK_PASSWORD:-${ADMIN_PASSWORD:-${APP_PASSWORD:-admin}}}"

COOKIE_FILE="$(mktemp)"
trap 'rm -f "$COOKIE_FILE"' EXIT

echo "=== Attempting login to TestLink ==="
echo "URL: ${APP_URL}/login.php"
echo "User: ${USERNAME}"

# Step 1: Fetch login page to retrieve session cookie and CSRF tokens if present
LOGIN_PAGE=$(curl -s -S -c "$COOKIE_FILE" "${APP_URL}/login.php")

CSRF_NAME=$(echo "$LOGIN_PAGE" | grep -o 'name="CSRFName" id="CSRFName" value="[^"]*"' | sed 's/.*value="//;s/"//' || true)
CSRF_TOKEN=$(echo "$LOGIN_PAGE" | grep -o 'name="CSRFToken" id="CSRFToken" value="[^"]*"' | sed 's/.*value="//;s/"//' || true)

# Step 2: Submit login credentials
LOGIN_RESP=$(curl -s -S -i -c "$COOKIE_FILE" -b "$COOKIE_FILE" \
    -X POST \
    -d "tl_login=${USERNAME}" \
    -d "tl_password=${PASSWORD}" \
    -d "login_submit=Log in" \
    -d "CSRFName=${CSRF_NAME}" \
    -d "CSRFToken=${CSRF_TOKEN}" \
    "${APP_URL}/login.php")

# Step 3: Check response headers and cookies for successful authentication
if echo "$LOGIN_RESP" | grep -iqE "TESTLINK_USER_AUTH_COOKIE|location.href=.*index\.php"; then
    DASHBOARD=$(curl -s -S -b "$COOKIE_FILE" -c "$COOKIE_FILE" -L "${APP_URL}/index.php")
    if echo "$DASHBOARD" | grep -iqE "navBar\.php|mainPage\.php|TestLink"; then
        echo "SUCCESS: Login successful and verified via dashboard access!"
        exit 0
    else
        echo "SUCCESS: Login successful (auth cookie received)!"
        exit 0
    fi
fi

echo "ERROR: Login failed. Response snippet:"
echo "$LOGIN_RESP" | head -n 30
exit 1
