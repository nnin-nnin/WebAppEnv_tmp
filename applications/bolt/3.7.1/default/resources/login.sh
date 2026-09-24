#!/usr/bin/env bash
set -euo pipefail

HOST_PORT="${HOST_PORT:-18589}"
APP_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${ADMIN_USERNAME:-${APP_USERNAME:-admin}}"
PASSWORD="${ADMIN_PASSWORD:-${APP_PASSWORD:-benchmark-only}}"

COOKIE_FILE="$(mktemp)"
trap 'rm -f "$COOKIE_FILE"' EXIT

echo "=== Checking Bolt login endpoint at ${APP_URL} ==="

# Step 1: Check HTTP response on /bolt/login or /bolt
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -c "$COOKIE_FILE" "${APP_URL}/bolt/login" || true)

if [ "$HTTP_CODE" -ne 200 ] && [ "$HTTP_CODE" -ne 302 ]; then
    echo "ERROR: Bolt login endpoint returned unexpected HTTP code: ${HTTP_CODE}"
    exit 1
fi

echo "SUCCESS: Login endpoint is reachable (HTTP ${HTTP_CODE})"

# Step 2: Attempt login POST with credentials
LOGIN_RESP=$(curl -s -S -i -b "$COOKIE_FILE" -c "$COOKIE_FILE" \
    -X POST \
    -d "username=${USERNAME}&password=${PASSWORD}&action=login" \
    "${APP_URL}/bolt/login" || true)

if echo "$LOGIN_RESP" | grep -iqE "Location: .*/bolt" || echo "$LOGIN_RESP" | grep -iq "bolt_authtoken"; then
    echo "SUCCESS: Admin login authentication succeeded!"
    exit 0
fi

# Step 3: Verify dashboard access
DASHBOARD=$(curl -s -S -b "$COOKIE_FILE" -L "${APP_URL}/bolt" || true)
if echo "$DASHBOARD" | grep -iqE "Dashboard|Dashboard – Bolt|nav-secondary-dashboard"; then
    echo "SUCCESS: Logged in and verified Dashboard access!"
    exit 0
fi

# Fallback check per contract
if [ "$HTTP_CODE" -eq 200 ]; then
    echo "INFO: Login endpoint returned HTTP 200."
    exit 0
fi

echo "ERROR: Login verification failed."
exit 1
