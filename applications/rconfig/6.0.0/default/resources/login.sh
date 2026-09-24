#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

HOST_PORT="${HOST_PORT:-18551}"
APP_URL="${APP_URL:-http://localhost:${HOST_PORT}}"
USERNAME="${1:-${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-admin}}}}"
PASSWORD="${2:-${ADMIN_PASSWORD:-${APP_PASSWORD:-${PASSWORD:-AdminPassword123!}}}}"

echo "Testing login to rConfig at ${APP_URL} for user '${USERNAME}'..."

COOKIE_JAR=$(mktemp)
trap 'rm -f "$COOKIE_JAR"' EXIT

# Step 1: Fetch login page to retrieve CSRF token and session cookie
LOGIN_HTML=$(curl -s -L -c "$COOKIE_JAR" "${APP_URL}/login")

CSRF_TOKEN=$(echo "$LOGIN_HTML" | grep -o 'name="csrf-token" content="[^"]*"' | head -n 1 | sed 's/.*content="//;s/"//')

if [ -z "$CSRF_TOKEN" ]; then
    echo "Error: Failed to extract CSRF token from login page."
    exit 1
fi

# Step 2: Post login request
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -b "$COOKIE_JAR" -c "$COOKIE_JAR" \
    -X POST "${APP_URL}/login" \
    -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" \
    -H "Content-Type: application/x-www-form-urlencoded" \
    --data-urlencode "username=${USERNAME}" \
    --data-urlencode "password=${PASSWORD}" \
    --data-urlencode "_token=${CSRF_TOKEN}")

if [ "$HTTP_CODE" != "302" ] && [ "$HTTP_CODE" != "200" ]; then
    echo "Login POST failed with HTTP status: $HTTP_CODE"
    exit 1
fi

# Step 3: Verify authenticated session on /dashboard
DASHBOARD_RES=$(curl -s -L -b "$COOKIE_JAR" "${APP_URL}/dashboard")
if echo "$DASHBOARD_RES" | grep -qiE "(rConfig|Dashboard|Logout|app-config)"; then
    echo "Login successful!"
    exit 0
else
    echo "Login verification failed: dashboard page content does not indicate authenticated session."
    exit 1
fi
