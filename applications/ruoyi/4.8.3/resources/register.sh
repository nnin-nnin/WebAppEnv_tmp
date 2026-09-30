#!/bin/bash
set -e

APP_URL="${APP_URL:-http://127.0.0.1:18080}"
ADMIN_USERNAME="${ADMIN_USERNAME:-admin}"
ADMIN_PASSWORD="${ADMIN_PASSWORD:-admin123}"

NEW_USER="${1:-testuser}"
NEW_PASS="${2:-testpass123}"

echo "Logging in as admin to get session..."
COOKIE_FILE=$(mktemp)

curl -s -X POST "$APP_URL/login" \
  -d "username=$ADMIN_USERNAME" \
  -d "password=$ADMIN_PASSWORD" \
  -d "rememberMe=false" \
  -c "$COOKIE_FILE" > /dev/null

echo "Creating new user $NEW_USER..."
RESPONSE=$(curl -s -X POST "$APP_URL/system/user/add" \
  -b "$COOKIE_FILE" \
  -d "loginName=$NEW_USER" \
  -d "userName=$NEW_USER" \
  -d "password=$NEW_PASS" \
  -d "roleIds=2" \
  -H "Accept: application/json")

rm -f "$COOKIE_FILE"

echo "Response: $RESPONSE"

if echo "$RESPONSE" | grep -q '"code":0'; then
    echo "User created successfully."
    exit 0
else
    echo "Failed to create user."
    exit 1
fi
