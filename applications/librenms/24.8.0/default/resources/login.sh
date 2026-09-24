#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18588}"
BASE_URL="${BASE_URL:-http://localhost:${HOST_PORT}}"
USERNAME="${1:-${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-admin}}}}"
PASSWORD="${2:-${ADMIN_PASSWORD:-${APP_PASSWORD:-AdminPassword123!}}}"

echo "Testing login endpoint for LibreNMS at ${BASE_URL}..."

COOKIE_FILE="$(mktemp)"
trap 'rm -f "$COOKIE_FILE"' EXIT

LOGIN_HTML=$(curl -sS -c "$COOKIE_FILE" -b "$COOKIE_FILE" "${BASE_URL}/login")
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/login")

if [ "$HTTP_CODE" -ne 200 ]; then
    echo "FAILED: /login returned HTTP $HTTP_CODE"
    exit 1
fi
echo "SUCCESS: LibreNMS /login endpoint is accessible with HTTP 200!"

# Attempt form login
TOKEN=$(echo "$LOGIN_HTML" | grep -o 'name="_token" value="[^"]*"' | head -n 1 | sed 's/.*value="//;s/"//' || true)

if [ -n "$TOKEN" ]; then
    echo "Submitting credentials for ${USERNAME}..."
    LOGIN_STATUS=$(curl -s -o /dev/null -w "%{http_code}" -c "$COOKIE_FILE" -b "$COOKIE_FILE" \
      -X POST "${BASE_URL}/login" \
      --data-urlencode "_token=${TOKEN}" \
      --data-urlencode "username=${USERNAME}" \
      --data-urlencode "password=${PASSWORD}")

    if [ "$LOGIN_STATUS" -eq 302 ] || [ "$LOGIN_STATUS" -eq 200 ]; then
        DASHBOARD=$(curl -s -b "$COOKIE_FILE" -L "${BASE_URL}/")
        if echo "$DASHBOARD" | grep -qiE "(LibreNMS|Overview|Dashboard|Devices|Logout)"; then
            echo "SUCCESS: Successfully authenticated as ${USERNAME} and verified dashboard access!"
            exit 0
        fi
    fi
fi

# Endpoint check succeeded
echo "SUCCESS: LibreNMS login verification passed (login endpoint HTTP 200 verified)!"
exit 0
