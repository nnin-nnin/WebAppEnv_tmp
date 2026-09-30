#!/usr/bin/env bash
set -euo pipefail

HOST_PORT="${HOST_PORT:-18852}"
BASE_URL="${BASE_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${ADMIN_USERNAME:-admin}"
PASSWORD="${ADMIN_PASSWORD:-AdminPassword123!}"
USER_AGENT="${USER_AGENT:-Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36}"

echo "Testing login for pbboard at ${BASE_URL}..."

COOKIE_JAR="$(mktemp)"
cleanup() {
    rm -f "$COOKIE_JAR"
}
trap cleanup EXIT

# Step 1: Pre-fetch admincp to initialize session
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -c "$COOKIE_JAR" -A "$USER_AGENT" "${BASE_URL}/admincp/index.php")
if [ "$HTTP_CODE" != "200" ]; then
    echo "ERROR: Failed to load ${BASE_URL}/admincp/index.php (HTTP $HTTP_CODE)" >&2
    exit 1
fi

# Step 2: Post login credentials with cookies
LOGIN_CODE=$(curl -s -o /dev/null -w "%{http_code}" -b "$COOKIE_JAR" -c "$COOKIE_JAR" \
    -A "$USER_AGENT" \
    -e "${BASE_URL}/admincp/index.php" \
    --data-urlencode "username=${USERNAME}" \
    --data-urlencode "password=${PASSWORD}" \
    --data-urlencode "submit=Login" \
    "${BASE_URL}/admincp/index.php?page=login&login=1")

if [ "$LOGIN_CODE" != "302" ] && [ "$LOGIN_CODE" != "200" ]; then
    echo "ERROR: Login POST returned unexpected HTTP $LOGIN_CODE" >&2
    exit 1
fi

# Step 3: Access admincp dashboard and verify access
ADMIN_PAGE=$(curl -s -L -b "$COOKIE_JAR" -c "$COOKIE_JAR" -A "$USER_AGENT" "${BASE_URL}/admincp/index.php")

if grep -qiE "Admincp|Administrator|Admin Notes|profile-45x45" <<< "$ADMIN_PAGE"; then
    echo "SUCCESS: Successfully authenticated as '${USERNAME}' and verified admincp dashboard access."
    exit 0
else
    echo "ERROR: Login succeeded but admin dashboard marker not found." >&2
    exit 1
fi
