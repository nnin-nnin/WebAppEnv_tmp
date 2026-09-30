#!/usr/bin/env bash
set -e

APP_URL="${APP_URL:-http://127.0.0.1:18746}"
USERNAME="${ADMIN_USERNAME:-${COLLABTIVE_USERNAME:-${APP_USER:-${ADMIN_USER:-${1:-admin}}}}}"
PASSWORD="${ADMIN_PASSWORD:-${COLLABTIVE_PASSWORD:-${APP_PASSWORD:-${ADMIN_PASSWORD:-${2:-admin}}}}}"

echo "Checking Collabtive web accessibility at ${APP_URL}/..."
HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/")
if [ "$HTTP_STATUS" -ne 200 ] && [ "$HTTP_STATUS" -ne 302 ]; then
  echo "Application not reachable at ${APP_URL}/, got HTTP ${HTTP_STATUS}"
  exit 1
fi

echo "Logging in to ${APP_URL} as ${USERNAME}..."
COOKIE_JAR=$(mktemp)
trap 'rm -f "$COOKIE_JAR"' EXIT

LOGIN_CODE=$(curl -s -o /dev/null -w "%{http_code}" -c "$COOKIE_JAR" \
  -d "username=${USERNAME}" \
  -d "pass=${PASSWORD}" \
  "${APP_URL}/manageuser.php?action=login")

if [ "$LOGIN_CODE" -ne 302 ] && [ "$LOGIN_CODE" -ne 200 ]; then
  echo "Login failed. HTTP Code: $LOGIN_CODE"
  exit 1
fi

# Check if login was successful by loading index.php with the session cookie
PAGE_CODE=$(curl -s -o /dev/null -w "%{http_code}" -b "$COOKIE_JAR" "${APP_URL}/index.php")
if [ "$PAGE_CODE" -ne 200 ]; then
  echo "Accessing dashboard after login failed with HTTP Code: $PAGE_CODE"
  exit 1
fi

PAGE_CONTENT=$(curl -s -b "$COOKIE_JAR" "${APP_URL}/index.php")
if echo "$PAGE_CONTENT" | grep -q 'action="manageuser.php?action=login"'; then
  echo "Login failed: Login form still present in response."
  exit 1
fi

echo "Login successful. Admin session verified (HTTP 200)."
exit 0
