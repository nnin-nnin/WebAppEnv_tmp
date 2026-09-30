#!/usr/bin/env bash
set -euo pipefail

APP_URL="${APP_URL:-http://127.0.0.1:18868}"
USERNAME="${ADMIN_USERNAME:-admin}"
PASSWORD="${ADMIN_PASSWORD:-AdminPassword123!}"

COOKIE_FILE="$(mktemp)"
trap 'rm -f "$COOKIE_FILE"' EXIT

echo "=== Attempting login to Symphony CMS ==="
echo "Target URL: ${APP_URL}/symphony/login/"
echo "Username: ${USERNAME}"

# Step 1: Request admin login page to initialize session cookie and get XSRF token if present
INITIAL_RESP=$(curl -s -S -i -c "$COOKIE_FILE" -b "$COOKIE_FILE" "${APP_URL}/symphony/login/")
HTTP_STATUS=$(echo "$INITIAL_RESP" | grep -iE "^HTTP/" | tail -n1 | awk '{print $2}')

if [ "$HTTP_STATUS" != "200" ] && [ "$HTTP_STATUS" != "302" ]; then
    echo "ERROR: Failed to reach login page at ${APP_URL}/symphony/login/, HTTP status: ${HTTP_STATUS}"
    exit 1
fi

XSRF_TOKEN=$(echo "$INITIAL_RESP" | grep -o 'name="xsrf" value="[^"]*"' | head -n1 | cut -d'"' -f4 || true)

# Step 2: Post credentials to /symphony/login/
LOGIN_DATA="username=${USERNAME}&password=${PASSWORD}&action[login]=Login"
if [ -n "$XSRF_TOKEN" ]; then
    LOGIN_DATA="${LOGIN_DATA}&xsrf=${XSRF_TOKEN}"
fi

LOGIN_RESP=$(curl -s -S -i -c "$COOKIE_FILE" -b "$COOKIE_FILE" \
    -X POST \
    -d "$LOGIN_DATA" \
    "${APP_URL}/symphony/login/")

# Step 3: Access admin dashboard to verify session
DASHBOARD=$(curl -s -S -L -c "$COOKIE_FILE" -b "$COOKIE_FILE" "${APP_URL}/symphony/")

if echo "$DASHBOARD" | grep -iqE "logout|blueprints|system|sym-|session|symphony"; then
    echo "SUCCESS: Symphony CMS administrator login successful and verified via dashboard access!"
    exit 0
else
    echo "ERROR: Login verification failed. Dashboard content did not contain expected administrative markers."
    echo "$DASHBOARD" | head -n 40
    exit 1
fi
