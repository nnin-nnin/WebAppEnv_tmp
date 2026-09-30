#!/usr/bin/env bash
set -euo pipefail

APP_URL="${APP_URL:-http://127.0.0.1:18804}"
USERNAME="${ADMIN_USERNAME:-admin}"
PASSWORD="${ADMIN_PASSWORD:-AdminPassword123!}"

COOKIE_FILE="$(mktemp)"
trap 'rm -f "$COOKIE_FILE"' EXIT

echo "=== Attempting login to BigTree CMS ==="
echo "Target URL: ${APP_URL}/admin/login/"
echo "Username: ${USERNAME}"

# Step 1: Request admin login page to initialize session cookie
INITIAL_RESP=$(curl -s -S -i -c "$COOKIE_FILE" -b "$COOKIE_FILE" "${APP_URL}/admin/login/")
HTTP_STATUS=$(echo "$INITIAL_RESP" | grep -iE "^HTTP/" | tail -n1 | awk '{print $2}')

if [ "$HTTP_STATUS" != "200" ] && [ "$HTTP_STATUS" != "302" ]; then
    echo "ERROR: Failed to reach login page at ${APP_URL}/admin/login/, HTTP status: ${HTTP_STATUS}"
    exit 1
fi

# Step 2: Post credentials to login/process/
LOGIN_RESP=$(curl -s -S -i -c "$COOKIE_FILE" -b "$COOKIE_FILE" \
    -X POST \
    -d "user=${USERNAME}" \
    -d "password=${PASSWORD}" \
    -d "stay_logged_in=1" \
    "${APP_URL}/admin/login/process/")

# Check if response redirects away from error
if echo "$LOGIN_RESP" | grep -iq "login/?error"; then
    echo "ERROR: BigTree CMS returned login error!"
    echo "$LOGIN_RESP" | head -n 30
    exit 1
fi

# Step 3: Access admin dashboard to verify session
DASHBOARD=$(curl -s -S -L -c "$COOKIE_FILE" -b "$COOKIE_FILE" "${APP_URL}/admin/")

if echo "$DASHBOARD" | grep -iqE "logout|login/logout|bigtree_header|nav_pages"; then
    echo "SUCCESS: BigTree CMS administrator login successful and verified via dashboard access!"
    exit 0
else
    echo "ERROR: Login verification failed. Dashboard content did not contain expected administrative markers."
    echo "$DASHBOARD" | head -n 40
    exit 1
fi
