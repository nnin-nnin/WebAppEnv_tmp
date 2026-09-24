#!/usr/bin/env bash
set -euo pipefail

APP_URL="${APP_URL:-http://127.0.0.1:18569}"
USERNAME="${MANTISBT_USER:-${ADMIN_USERNAME:-${APP_USER:-administrator}}}"
PASSWORD="${MANTISBT_PASSWORD:-${ADMIN_PASSWORD:-${APP_PASSWORD:-root}}}"

COOKIE_FILE="$(mktemp)"
trap 'rm -f "$COOKIE_FILE"' EXIT

echo "=== Attempting login to MantisBT ==="
echo "URL: ${APP_URL}/login.php"
echo "User: ${USERNAME}"

# Step 1: Submit login credentials directly
LOGIN_RESP=$(curl -s -S -i -c "$COOKIE_FILE" -b "$COOKIE_FILE" \
    -X POST \
    -d "username=${USERNAME}" \
    -d "password=${PASSWORD}" \
    -d "return=my_view_page.php" \
    "${APP_URL}/login.php")

# Check if redirect location or cookie was set
if echo "$LOGIN_RESP" | grep -iqE "Location: .*(login_cookie_test\.php|my_view_page\.php|account_page\.php)" || echo "$LOGIN_RESP" | grep -iq "MANTIS_STRING_COOKIE"; then
    # Step 2: Follow session to verify dashboard access
    DASHBOARD=$(curl -s -S -b "$COOKIE_FILE" -c "$COOKIE_FILE" -L "${APP_URL}/my_view_page.php")
    if echo "$DASHBOARD" | grep -iqE "My View|logout_page\.php|user-info"; then
        echo "SUCCESS: Login successful and verified via dashboard access!"
        exit 0
    else
        echo "WARNING: Session cookie set but dashboard content not matched. Checking redirect response..."
        if echo "$LOGIN_RESP" | grep -iq "MANTIS_STRING_COOKIE"; then
            echo "SUCCESS: Login successful (session cookie received)!"
            exit 0
        fi
    fi
fi

echo "ERROR: Login failed. Response snippet:"
echo "$LOGIN_RESP" | head -n 30
exit 1
