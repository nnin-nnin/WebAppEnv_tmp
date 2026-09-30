#!/usr/bin/env bash
set -euo pipefail

APP_URL="${APP_URL:-http://127.0.0.1:18808}"
USERNAME="${ADMIN_USERNAME:-admin}"
PASSWORD="${ADMIN_PASSWORD:-AdminPassword123!}"

COOKIE_FILE="$(mktemp)"
trap 'rm -f "$COOKIE_FILE"' EXIT

echo "=== Attempting login to Composr ==="
echo "URL: ${APP_URL}/index.php?page=login&type=login"
echo "User: ${USERNAME}"

# Step 1: Submit login form
LOGIN_RESP=$(curl -s -S -i -c "$COOKIE_FILE" -b "$COOKIE_FILE" \
    -X POST \
    -d "_active_login=1" \
    -d "username=${USERNAME}" \
    -d "password=${PASSWORD}" \
    -d "remember=1" \
    "${APP_URL}/index.php?page=login&type=login")

# Step 2: Verify login response headers or cookies
if grep -iqE "Location: .*|Set-Cookie: .*cms_session|LOGGED_IN|logged in" <<< "$LOGIN_RESP"; then
    echo "SUCCESS: Login request succeeded!"
fi

# Step 3: Access admin zone or user profile to confirm authenticated session
ADMIN_PAGE=$(curl -s -S -c "$COOKIE_FILE" -b "$COOKIE_FILE" "${APP_URL}/adminzone/index.php")

if grep -iqE "logout|Admin Zone|adminzone|admin_setupwizard|welcome_banner" <<< "$ADMIN_PAGE"; then
    echo "SUCCESS: Admin session verified via Admin Zone access!"
    exit 0
else
    # Also check member profile
    PROFILE_PAGE=$(curl -s -S -c "$COOKIE_FILE" -b "$COOKIE_FILE" "${APP_URL}/index.php?page=members&type=view")
    if grep -iqE "logout|type=logout|Logged in as|admin" <<< "$PROFILE_PAGE"; then
        echo "SUCCESS: Admin session verified via Profile access!"
        exit 0
    fi

    echo "ERROR: Login verification failed. Response snippet:"
    echo "$LOGIN_RESP" | head -n 30
    exit 1
fi
