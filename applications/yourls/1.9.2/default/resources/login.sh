#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18654}"
BASE_URL="${BASE_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${1:-${ADMIN_USERNAME:-${ADMIN_USER:-admin}}}"
PASSWORD="${2:-${ADMIN_PASSWORD:-${ADMIN_PASS:-Admin123456!}}}"

echo "Testing login for YOURLS at ${BASE_URL} with user ${USERNAME}..."

COOKIE_FILE="$(mktemp)"
trap 'rm -f "$COOKIE_FILE"' EXIT

# Step 1: Ensure initial install is triggered if needed
INIT_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/admin/")
if [ "$INIT_STATUS" = "307" ] || [ "$INIT_STATUS" = "302" ]; then
    echo "Initial install required, triggering install.php..."
    curl -s -L "${BASE_URL}/admin/install.php?install=1" > /dev/null 2>&1 || true
fi

# Step 2: Fetch login page to retrieve session cookie and CSRF nonce
LOGIN_PAGE=$(curl -sS -c "$COOKIE_FILE" "${BASE_URL}/admin/")
NONCE=$(echo "$LOGIN_PAGE" | grep -oE 'name=["\x27]nonce["\x27]\s+value=["\x27][^"\x27]+["\x27]' | sed -E 's/.*value=["\x27]([^"\x27]+)["\x27].*/\1/')

if [ -n "$NONCE" ]; then
    echo "Submitting login credentials with retrieved nonce..."
    LOGIN_RESP=$(curl -sS -i -b "$COOKIE_FILE" -c "$COOKIE_FILE" \
        -X POST "${BASE_URL}/admin/index.php" \
        --data-urlencode "username=${USERNAME}" \
        --data-urlencode "password=${PASSWORD}" \
        --data-urlencode "nonce=${NONCE}")
fi

# Step 3: Verify authenticated access to /admin/
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -b "$COOKIE_FILE" "${BASE_URL}/admin/")

if [ "$HTTP_CODE" = "200" ]; then
    echo "SUCCESS: Access to ${BASE_URL}/admin/ returned HTTP 200!"
    exit 0
else
    echo "FAILED: Access to ${BASE_URL}/admin/ returned HTTP ${HTTP_CODE}"
    exit 1
fi
