#!/usr/bin/env bash
set -eo pipefail

HOST_PORT="${HOST_PORT:-18854}"
BASE_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${ADMIN_USERNAME:-admin}"
PASSWORD="${ADMIN_PASSWORD:-AdminPassword123!}"

echo "[*] Testing login for Phabricator at ${BASE_URL}..."

COOKIE_JAR="$(mktemp)"
cleanup() {
    rm -f "$COOKIE_JAR"
}
trap cleanup EXIT

# Step 1: Pre-fetch /login/ to obtain CSRF token and session cookies
LOGIN_PAGE=$(curl --noproxy "*" -s -c "$COOKIE_JAR" "${BASE_URL}/login/")
CSRF_TOKEN=$(echo "$LOGIN_PAGE" | grep -o 'name="__csrf__"[^>]*' | head -n 1 | sed -n 's/.*value="\([^"]*\)".*/\1/p')

if [ -z "$CSRF_TOKEN" ]; then
    echo "[-] ERROR: Failed to extract CSRF token from ${BASE_URL}/login/" >&2
    exit 1
fi
echo "[+] Extracted CSRF token: ${CSRF_TOKEN}"

# Step 2: Post login credentials
LOGIN_RESP=$(curl --noproxy "*" -s -i -b "$COOKIE_JAR" -c "$COOKIE_JAR" \
    -X POST "${BASE_URL}/auth/login/password:self/" \
    --data-urlencode "__csrf__=${CSRF_TOKEN}" \
    --data-urlencode "__form__=1" \
    --data-urlencode "username=${USERNAME}" \
    --data-urlencode "password=${PASSWORD}" \
    --data-urlencode "__submit__=Log In")

HTTP_CODE=$(echo "$LOGIN_RESP" | grep -E '^HTTP/' | head -n 1 | awk '{print $2}')
if [ "$HTTP_CODE" -eq 302 ] || [ "$HTTP_CODE" -eq 200 ]; then
    echo "[+] SUCCESS: Credentials accepted (HTTP $HTTP_CODE)!"
else
    echo "[-] ERROR: Login failed with HTTP $HTTP_CODE" >&2
    echo "$LOGIN_RESP" | head -n 25 >&2
    exit 1
fi

# Step 3: Access root page and verify admin dashboard access
DASHBOARD_PAGE=$(curl --noproxy "*" -s -L -b "$COOKIE_JAR" -c "$COOKIE_JAR" "${BASE_URL}/")

if echo "$DASHBOARD_PAGE" | grep -qiE "Log Out|${USERNAME}|phabricator-main-menu|Applications"; then
    echo "[+] SUCCESS: Successfully authenticated as '${USERNAME}' and verified Phabricator access."
    exit 0
else
    echo "[-] ERROR: Authenticated dashboard marker not found." >&2
    exit 1
fi
