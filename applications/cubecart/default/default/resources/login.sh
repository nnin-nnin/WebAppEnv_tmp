#!/usr/bin/env bash
set -euo pipefail

APP_URL="${APP_URL:-http://127.0.0.1:18812}"
USERNAME="${1:-${ADMIN_USERNAME:-${USERNAME:-admin}}}"
PASSWORD="${2:-${ADMIN_PASSWORD:-${PASSWORD:-AdminPassword123!}}}"

UA="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"
COOKIE_JAR="$(mktemp)"
LOGIN_PAGE="$(mktemp)"
LOGIN_RES="$(mktemp)"
trap 'rm -f "$COOKIE_JAR" "$LOGIN_PAGE" "$LOGIN_RES"' EXIT

echo "Fetching initial admin login page from ${APP_URL}/admin.php..."
curl -s -L -A "$UA" -c "$COOKIE_JAR" "${APP_URL}/admin.php" > "$LOGIN_PAGE"

# Extract CSRF token from the login form
TOKEN=$(grep -o 'name="token"[^>]*value="[^"]*"' "$LOGIN_PAGE" | head -n 1 | sed -e 's/.*value="//' -e 's/"//' || echo "")

if [ -z "$TOKEN" ]; then
    # Fallback pattern if token field attributes are in reverse order
    TOKEN=$(grep -o 'value="[^"]*"[^>]*name="token"' "$LOGIN_PAGE" | head -n 1 | sed -e 's/value="//' -e 's/".*//' || echo "")
fi

echo "Submitting credentials for user: ${USERNAME}..."
HTTP_CODE=$(curl -s -o "$LOGIN_RES" -w "%{http_code}" \
    -A "$UA" -b "$COOKIE_JAR" -c "$COOKIE_JAR" \
    -X POST "${APP_URL}/admin.php" \
    --data-urlencode "username=${USERNAME}" \
    --data-urlencode "password=${PASSWORD}" \
    --data-urlencode "token=${TOKEN}" \
    --data-urlencode "redir=" \
    --data-urlencode "login=Log In")

echo "Verifying admin dashboard access with session cookie..."
DASHBOARD_HTML=$(curl -s -L -A "$UA" -b "$COOKIE_JAR" "${APP_URL}/admin.php")

if echo "$DASHBOARD_HTML" | grep -qiE "logout|admin control panel|dashboard|cubecart.*admin"; then
    echo "SUCCESS: Admin login verified successfully for user '${USERNAME}'!"
    exit 0
fi

echo "ERROR: Admin login verification failed for user '${USERNAME}' (HTTP Code: ${HTTP_CODE})."
head -n 35 "$LOGIN_RES"
exit 1
