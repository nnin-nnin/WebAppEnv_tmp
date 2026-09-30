#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18843}"
USERNAME="${ADMIN_USERNAME:-admin@admin.test}"
PASSWORD="${ADMIN_PASSWORD:-AdminPassword123!}"
BASE_URL="http://127.0.0.1:${HOST_PORT}"
LOGIN_URL="${BASE_URL}/users/login"

echo "Attempting admin login to MISP at ${LOGIN_URL}..."

COOKIE_JAR=$(mktemp)
trap 'rm -f "$COOKIE_JAR"' EXIT

# Step 1: GET login page to obtain session cookies and CSRF security tokens
LOGIN_PAGE=$(curl -s -c "$COOKIE_JAR" -b "$COOKIE_JAR" "$LOGIN_URL")

TOKEN_KEY=$(echo "$LOGIN_PAGE" | grep -o 'name="data\[_Token\]\[key\]"[^>]*value="[^"]*"' | sed -E 's/.*value="([^"]*)".*/\1/')
TOKEN_FIELDS=$(echo "$LOGIN_PAGE" | grep -o 'name="data\[_Token\]\[fields\]"[^>]*value="[^"]*"' | sed -E 's/.*value="([^"]*)".*/\1/')

if [ -z "$TOKEN_KEY" ]; then
    echo "FAILED: Could not extract CSRF token key from login page."
    exit 1
fi

UNQUOTED_FIELDS=$(python3 -c "import urllib.parse, sys; print(urllib.parse.unquote(sys.argv[1]))" "$TOKEN_FIELDS")

# Step 2: POST login form with session cookie and CSRF fields
RESPONSE=$(curl -s -c "$COOKIE_JAR" -b "$COOKIE_JAR" -L \
  -H "Referer: ${LOGIN_URL}" \
  -H "Origin: ${BASE_URL}" \
  --data-urlencode "_method=POST" \
  --data-urlencode "data[_Token][key]=${TOKEN_KEY}" \
  --data-urlencode "data[User][email]=${USERNAME}" \
  --data-urlencode "data[User][password]=${PASSWORD}" \
  --data-urlencode "data[_Token][fields]=${UNQUOTED_FIELDS}" \
  --data-urlencode "data[_Token][unlocked]=" \
  "$LOGIN_URL")

# Step 3: Check for successful login indicators (Logout link, dashboard elements, etc.)
if echo "$RESPONSE" | grep -qiE "logout|users/logout|Log out|Events|misp-logo"; then
    echo "SUCCESS: Admin login and dashboard closure successful for ${USERNAME}!"
    exit 0
else
    echo "Login validation response snippet:"
    echo "$RESPONSE" | head -n 30
    echo "FAILED: Admin login validation failed."
    exit 1
fi
