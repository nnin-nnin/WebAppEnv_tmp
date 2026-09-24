#!/usr/bin/env bash
set -euo pipefail

APP_URL="${APP_URL:-http://127.0.0.1:18009}"
USERNAME="${ADMIN_USERNAME:-admin}"
PASSWORD="${ADMIN_PASSWORD:-benchmark-only}"

COOKIE_FILE="$(mktemp)"
trap 'rm -f "$COOKIE_FILE"' EXIT

echo "=== Attempting login to AnchorCMS ==="
echo "URL: ${APP_URL}/index.php/admin/login"
echo "User: ${USERNAME}"

# Step 1: Fetch login page to obtain CSRF token and session cookie
HTML=$(curl -s -S -c "$COOKIE_FILE" -b "$COOKIE_FILE" "${APP_URL}/index.php/admin/login")

TOKEN=$(echo "$HTML" | grep -o 'value="[^"]*"' | head -n1 | cut -d'"' -f2 || true)

if [ -z "$TOKEN" ]; then
    HTML=$(curl -s -S -c "$COOKIE_FILE" -b "$COOKIE_FILE" "${APP_URL}/admin/login")
    TOKEN=$(echo "$HTML" | grep -o 'value="[^"]*"' | head -n1 | cut -d'"' -f2 || true)
fi

if [ -z "$TOKEN" ]; then
    echo "ERROR: Failed to extract CSRF token from login page."
    exit 1
fi

echo "Extracted CSRF token: ${TOKEN:0:10}..."

# Step 2: Submit login form
LOGIN_RESP=$(curl -s -S -i -c "$COOKIE_FILE" -b "$COOKIE_FILE" \
    -X POST \
    -d "token=${TOKEN}" \
    -d "user=${USERNAME}" \
    -d "pass=${PASSWORD}" \
    "${APP_URL}/index.php/admin/login")

if echo "$LOGIN_RESP" | grep -iqE "Location: .*/admin/(posts|panel|pages)" || echo "$LOGIN_RESP" | grep -iq "logout"; then
    echo "SUCCESS: Login successful!"
    exit 0
fi

DASHBOARD=$(curl -s -S -c "$COOKIE_FILE" -b "$COOKIE_FILE" "${APP_URL}/index.php/admin/posts")
if echo "$DASHBOARD" | grep -iqE "logout|admin/logout|Posts"; then
    echo "SUCCESS: Login verified via dashboard access!"
    exit 0
else
    echo "ERROR: Login failed. Response snippet:"
    echo "$LOGIN_RESP" | head -n 30
    exit 1
fi
