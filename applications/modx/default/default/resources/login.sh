#!/usr/bin/env bash
set -euo pipefail

APP_URL="${APP_URL:-http://127.0.0.1:18844}"
USERNAME="${ADMIN_USERNAME:-admin}"
PASSWORD="${ADMIN_PASSWORD:-AdminPassword123!}"

COOKIE_FILE="$(mktemp)"
trap 'rm -f "$COOKIE_FILE"' EXIT

echo "=== Attempting login to MODX Revolution ==="
echo "Target URL: ${APP_URL}/manager/"
echo "Username: ${USERNAME}"

# Step 1: Initial GET to acquire session cookie
HTTP_INIT=$(curl -s -S -o /dev/null -w "%{http_code}" -c "$COOKIE_FILE" -b "$COOKIE_FILE" "${APP_URL}/manager/")
if [ "$HTTP_INIT" -ne 200 ] && [ "$HTTP_INIT" -ne 302 ]; then
    echo "ERROR: Initial GET to ${APP_URL}/manager/ returned HTTP ${HTTP_INIT}"
    exit 1
fi

# Step 2: POST credentials to manager login endpoint
LOGIN_RESP=$(curl -s -S -i -c "$COOKIE_FILE" -b "$COOKIE_FILE" \
    -X POST \
    -d "login_context=mgr" \
    -d "modahsh=" \
    -d "returnUrl=/manager/" \
    -d "username=${USERNAME}" \
    -d "password=${PASSWORD}" \
    -d "login=1" \
    "${APP_URL}/manager/")

# Check for redirect to manager dashboard
if echo "$LOGIN_RESP" | grep -iqE "Location: .*/manager/"; then
    echo "SUCCESS: Login request redirected to manager dashboard!"
fi

# Step 3: Access dashboard and verify manager interface
DASHBOARD_HTML=$(curl -s -S -c "$COOKIE_FILE" -b "$COOKIE_FILE" "${APP_URL}/manager/")

if echo "$DASHBOARD_HTML" | grep -iqE "Dashboard.*MODX Revolution|HTTP_MODAUTH|modx-dashboard|modx-layout"; then
    echo "SUCCESS: Admin dashboard loaded and authenticated successfully!"
    exit 0
else
    echo "ERROR: Failed to authenticate or access dashboard. Response excerpt:"
    echo "$DASHBOARD_HTML" | head -n 30
    exit 1
fi
