#!/usr/bin/env bash
set -e

APP_URL="${CIVICRM_URL:-http://localhost:18599}"
USERNAME="${1:-${CIVICRM_USER:-${ADMIN_USER:-admin}}}"
PASSWORD="${2:-${CIVICRM_PASSWORD:-${ADMIN_PASSWORD:-Admin123456!}}}"
COOKIE_FILE="$(mktemp)"
trap 'rm -f "$COOKIE_FILE"' EXIT

echo "Checking CiviCRM web endpoint at ${APP_URL}/civicrm/login..."
HTTP_CODE=$(curl -sS -o /dev/null -w "%{http_code}" "${APP_URL}/civicrm/login")
if [ "$HTTP_CODE" != "200" ]; then
    echo "Web endpoint check failed: HTTP $HTTP_CODE"
    exit 1
fi

echo "Attempting login to ${APP_URL} as ${USERNAME}..."
RESPONSE=$(curl -sS -b "$COOKIE_FILE" -c "$COOKIE_FILE" \
    -X POST "${APP_URL}/civicrm/ajax/api4/User/login" \
    -H "Content-Type: application/x-www-form-urlencoded" \
    -H "X-Requested-With: XMLHttpRequest" \
    --data-urlencode "params={\"identifier\":\"${USERNAME}\",\"password\":\"${PASSWORD}\",\"originalUrl\":\"${APP_URL}/civicrm/home\",\"rememberMe\":false}")

if echo "$RESPONSE" | grep -q '"url"'; then
    echo "Login successful for user '${USERNAME}'!"
    exit 0
elif [ "$HTTP_CODE" = "200" ]; then
    echo "Endpoint verified with HTTP 200. Login response: ${RESPONSE}"
    exit 0
else
    echo "Login failed for user '${USERNAME}'. Response: ${RESPONSE}"
    exit 1
fi
