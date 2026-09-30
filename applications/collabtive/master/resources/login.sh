#!/usr/bin/env bash
set -e
APP_URL=${APP_URL:-"http://127.0.0.1:18089"}
USERNAME="${COLLABTIVE_USERNAME:-${1:-admin}}"
PASSWORD="${COLLABTIVE_PASSWORD:-${2:-123456}}"

COOKIE_FILE=$(mktemp)
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -c "$COOKIE_FILE" \
  -d "username=${USERNAME}" \
  -d "pass=${PASSWORD}" \
  "${APP_URL}/manageuser.php?action=login")

if [ "$HTTP_CODE" -ne 302 ] && [ "$HTTP_CODE" -ne 200 ]; then
  echo "Login failed. HTTP Code: $HTTP_CODE"
  rm -f "$COOKIE_FILE"
  exit 1
fi

if curl -s -b "$COOKIE_FILE" "${APP_URL}/index.php" | grep -q 'action="manageuser.php?action=login"'; then
  echo "Login failed. Invalid credentials."
  rm -f "$COOKIE_FILE"
  exit 1
fi

echo "Login successful"
rm -f "$COOKIE_FILE"
exit 0
