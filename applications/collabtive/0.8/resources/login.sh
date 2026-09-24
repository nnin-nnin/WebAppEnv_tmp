#!/bin/bash
set -e

APP_URL="${APP_URL:-http://localhost:18088}"
USERNAME="${1:-admin}"
PASSWORD="${2:-123456}"

echo "Logging in to ${APP_URL} as ${USERNAME}..."

COOKIE_JAR=$(mktemp)

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -c "$COOKIE_JAR" \
  -d "username=${USERNAME}" \
  -d "pass=${PASSWORD}" \
  "${APP_URL}/manageuser.php?action=login")

if [ "$HTTP_CODE" -ne 302 ] && [ "$HTTP_CODE" -ne 200 ]; then
  echo "Login failed. HTTP Code: $HTTP_CODE"
  rm -f "$COOKIE_JAR"
  exit 1
fi

# Check if login was successful by loading index.php and checking for login form
if curl -s -b "$COOKIE_JAR" "${APP_URL}/index.php" | grep -q 'action="manageuser.php?action=login"'; then
  echo "Login failed. Invalid credentials."
  rm -f "$COOKIE_JAR"
  exit 1
fi

echo "Login successful."
rm -f "$COOKIE_JAR"
exit 0
