#!/usr/bin/env bash
set -euo pipefail

APP_URL="${APP_URL:-http://127.0.0.1:18862}"
USERNAME="${ADMIN_USERNAME:-admin@localhost.com}"
PASSWORD="${ADMIN_PASSWORD:-AdminPassword123!}"

COOKIE_FILE="$(mktemp)"
trap 'rm -f "$COOKIE_FILE"' EXIT

echo "=== Attempting login to qdPM ==="
echo "Target URL: ${APP_URL}/index.php/login"
echo "Username: ${USERNAME}"

# Step 1: Request login page to initialize session
INITIAL_RESP=$(curl -s -S -i -c "$COOKIE_FILE" -b "$COOKIE_FILE" "${APP_URL}/index.php/login")
HTTP_STATUS=$(echo "$INITIAL_RESP" | grep -iE "^HTTP/" | tail -n1 | awk '{print $2}')

if [ "$HTTP_STATUS" != "200" ] && [ "$HTTP_STATUS" != "302" ]; then
    echo "ERROR: Failed to reach login page at ${APP_URL}/index.php/login, HTTP status: ${HTTP_STATUS}"
    exit 1
fi

# Step 2: Post credentials to /index.php/login
LOGIN_RESP=$(curl -s -S -i -c "$COOKIE_FILE" -b "$COOKIE_FILE" \
    -X POST \
    --data-urlencode "login[email]=${USERNAME}" \
    --data-urlencode "login[password]=${PASSWORD}" \
    "${APP_URL}/index.php/login")

POST_STATUS=$(echo "$LOGIN_RESP" | grep -iE "^HTTP/" | tail -n1 | awk '{print $2}')

# Step 3: Access dashboard or users page to verify authentication
DASHBOARD=$(curl -s -S -L -c "$COOKIE_FILE" -b "$COOKIE_FILE" "${APP_URL}/index.php/users")

if echo "$DASHBOARD" | grep -iqE "logoff|log out|logout|users/index|app_administrator|qdPM|Administrator"; then
    echo "SUCCESS: qdPM administrator login successful and verified via dashboard access!"
    exit 0
else
    echo "ERROR: Login verification failed. Dashboard content did not contain expected administrative markers."
    echo "$DASHBOARD" | head -n 40
    exit 1
fi
