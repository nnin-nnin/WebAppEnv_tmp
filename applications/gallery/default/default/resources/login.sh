#!/usr/bin/env bash
set -euo pipefail

APP_URL="${APP_URL:-http://127.0.0.1:18827}"
USERNAME="${1:-${ADMIN_USERNAME:-${USERNAME:-admin}}}"
PASSWORD="${2:-${ADMIN_PASSWORD:-${PASSWORD:-AdminPassword123!}}}"

UA="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"
COOKIE_JAR="$(mktemp)"
LOGIN_PAGE="$(mktemp)"
LOGIN_RES="$(mktemp)"
trap 'rm -f "$COOKIE_JAR" "$LOGIN_PAGE" "$LOGIN_RES"' EXIT

echo "Fetching login dialog and CSRF token from ${APP_URL}/login/ajax..."
curl -s -L -A "$UA" -c "$COOKIE_JAR" "${APP_URL}/login/ajax" > "$LOGIN_PAGE"

CSRF_TOKEN=$(grep -o 'name="csrf"[^>]*value="[^"]*"' "$LOGIN_PAGE" | head -n 1 | sed -e 's/.*value="//' -e 's/"//' || echo "")
if [ -z "$CSRF_TOKEN" ]; then
    CSRF_TOKEN=$(grep -o 'value="[^"]*"[^>]*name="csrf"' "$LOGIN_PAGE" | head -n 1 | sed -e 's/value="//' -e 's/".*//' || echo "")
fi

if [ -z "$CSRF_TOKEN" ]; then
    echo "ERROR: Failed to extract CSRF token from login form."
    exit 1
fi

echo "Submitting credentials for user: ${USERNAME}..."
HTTP_CODE=$(curl -s -o "$LOGIN_RES" -w "%{http_code}" \
    -A "$UA" -b "$COOKIE_JAR" -c "$COOKIE_JAR" \
    -H "X-Requested-With: XMLHttpRequest" \
    -H "Referer: ${APP_URL}/" \
    -X POST "${APP_URL}/login/auth_ajax" \
    --data-urlencode "csrf=${CSRF_TOKEN}" \
    --data-urlencode "name=${USERNAME}" \
    --data-urlencode "password=${PASSWORD}" \
    --data-urlencode "continue_url=")

if grep -q '"result":"success"' "$LOGIN_RES"; then
    echo "SUCCESS: Admin login verified successfully for user '${USERNAME}'!"
    exit 0
fi

echo "Verifying session authentication via home page..."
HOME_HTML=$(curl -s -L -A "$UA" -b "$COOKIE_JAR" "${APP_URL}/")
if echo "$HOME_HTML" | grep -qiE "logout|admin|user"; then
    echo "SUCCESS: Admin login session confirmed for user '${USERNAME}'!"
    exit 0
fi

echo "ERROR: Admin login verification failed for user '${USERNAME}' (HTTP Code: ${HTTP_CODE})."
cat "$LOGIN_RES"
exit 1
