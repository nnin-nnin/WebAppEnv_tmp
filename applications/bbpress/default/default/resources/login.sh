#!/usr/bin/env bash
set -euo pipefail

HOST_PORT="${HOST_PORT:-18803}"
BASE_URL="${BASE_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${ADMIN_USERNAME:-admin}"
PASSWORD="${ADMIN_PASSWORD:-AdminPassword123!}"

echo "Testing login for bbpress at ${BASE_URL}..."

COOKIE_JAR="$(mktemp)"
cleanup() {
    rm -f "$COOKIE_JAR"
}
trap cleanup EXIT

# Step 1: Pre-fetch wp-login.php to obtain wordpress_test_cookie
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -c "$COOKIE_JAR" "${BASE_URL}/wp-login.php")
if [ "$HTTP_CODE" != "200" ]; then
    echo "ERROR: Failed to load ${BASE_URL}/wp-login.php (HTTP $HTTP_CODE)" >&2
    exit 1
fi

# Step 2: Post login credentials with cookies
LOGIN_CODE=$(curl -s -o /dev/null -w "%{http_code}" -b "$COOKIE_JAR" -c "$COOKIE_JAR" \
    --data-urlencode "log=${USERNAME}" \
    --data-urlencode "pwd=${PASSWORD}" \
    --data-urlencode "wp-submit=Log In" \
    --data-urlencode "testcookie=1" \
    --data-urlencode "redirect_to=${BASE_URL}/wp-admin/" \
    "${BASE_URL}/wp-login.php")

if [ "$LOGIN_CODE" != "302" ] && [ "$LOGIN_CODE" != "200" ]; then
    echo "ERROR: Login POST returned unexpected HTTP $LOGIN_CODE" >&2
    exit 1
fi

# Step 3: Access wp-admin and verify dashboard access
ADMIN_PAGE=$(curl -s -L -b "$COOKIE_JAR" -c "$COOKIE_JAR" "${BASE_URL}/wp-admin/")

if grep -qiE "Dashboard|bbpress|Forums|Howdy" <<< "$ADMIN_PAGE"; then
    echo "SUCCESS: Successfully authenticated as '${USERNAME}' and verified admin dashboard access."
    exit 0
else
    echo "ERROR: Login succeeded but admin dashboard marker not found." >&2
    exit 1
fi
