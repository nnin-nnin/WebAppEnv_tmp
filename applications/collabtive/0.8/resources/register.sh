#!/bin/bash
set -e

APP_URL="${APP_URL:-http://localhost:8080}"
ADMIN_USER="${ADMIN_USER:-admin}"
ADMIN_PASS="${ADMIN_PASS:-123456}"

NEW_USER="${1}"
NEW_PASS="${2}"
NEW_EMAIL="${3:-user@example.com}"
ROLE="${4:-2}" # 2 is usually User role

if [ -z "$NEW_USER" ] || [ -z "$NEW_PASS" ]; then
    echo "Usage: $0 <new_user> <new_password> [email] [role_id]"
    exit 1
fi

COOKIE_JAR=$(mktemp)

# Admin login
curl -s -c "$COOKIE_JAR" -d "username=${ADMIN_USER}" -d "pass=${ADMIN_PASS}" "${APP_URL}/manageuser.php?action=login" > /dev/null

# Register new user
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -b "$COOKIE_JAR" \
  -d "name=${NEW_USER}" \
  -d "pass=${NEW_PASS}" \
  -d "email=${NEW_EMAIL}" \
  -d "role=${ROLE}" \
  -d "rate=0.0" \
  "${APP_URL}/admin.php?action=adduser")

rm -f "$COOKIE_JAR"

if [ "$HTTP_CODE" -ne 302 ] && [ "$HTTP_CODE" -ne 200 ]; then
  echo "User creation failed. HTTP Code: $HTTP_CODE"
  exit 1
fi

echo "User created successfully."
exit 0
