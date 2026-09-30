#!/usr/bin/env bash
set -euo pipefail

APP_URL="${APP_URL:-http://127.0.0.1:18829}"
USERNAME="${ADMIN_USERNAME:-admin}"
PASSWORD="${ADMIN_PASSWORD:-AdminPassword123!}"

COOKIE_FILE="$(mktemp)"
trap 'rm -f "$COOKIE_FILE"' EXIT

echo "=== Attempting login to Horde Groupware ==="
echo "Target URL: ${APP_URL}/login.php"
echo "Username: ${USERNAME}"

# Step 1: Request login page to initialize session
INITIAL_RESP=$(curl -s -S -i -c "$COOKIE_FILE" -b "$COOKIE_FILE" "${APP_URL}/login.php")
HTTP_STATUS=$(echo "$INITIAL_RESP" | grep -iE "^HTTP/" | tail -n1 | awk '{print $2}')

if [ "$HTTP_STATUS" != "200" ] && [ "$HTTP_STATUS" != "302" ]; then
    echo "ERROR: Failed to reach login page at ${APP_URL}/login.php, HTTP status: ${HTTP_STATUS}"
    exit 1
fi

# Step 2: POST authentication credentials
LOGIN_RESP=$(curl -s -S -i -c "$COOKIE_FILE" -b "$COOKIE_FILE" \
    -X POST \
    -d "horde_user=${USERNAME}" \
    -d "horde_pass=${PASSWORD}" \
    -d "login_post=1" \
    -d "login_button=Log+in" \
    "${APP_URL}/login.php")

LOGIN_STATUS=$(echo "$LOGIN_RESP" | grep -iE "^HTTP/" | tail -n1 | awk '{print $2}')

# Check for successful redirection or portal landing
if [ "$LOGIN_STATUS" != "302" ] && [ "$LOGIN_STATUS" != "200" ]; then
    echo "ERROR: Horde returned unexpected status ${LOGIN_STATUS} on login POST!"
    echo "$LOGIN_RESP" | head -n 30
    exit 1
fi

# Step 3: Access dashboard/portal to verify authenticated session
DASHBOARD=$(curl -s -S -L -c "$COOKIE_FILE" -b "$COOKIE_FILE" "${APP_URL}/services/portal/")

if echo "$DASHBOARD" | grep -iqE "Administration|horde-navigation|horde-version|horde-info|logout"; then
    echo "SUCCESS: Horde administrator login successful and verified via portal/dashboard access!"
    exit 0
else
    echo "ERROR: Login verification failed. Dashboard content did not contain expected administrative markers."
    echo "$DASHBOARD" | head -n 40
    exit 1
fi
