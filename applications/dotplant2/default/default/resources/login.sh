#!/usr/bin/env bash
set -eo pipefail

HOST_PORT="${HOST_PORT:-18818}"
BASE_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${ADMIN_USERNAME:-admin}"
PASSWORD="${ADMIN_PASSWORD:-AdminPassword123!}"

echo "[*] Testing login for dotplant2 at ${BASE_URL}..."

COOKIE_JAR="$(mktemp)"
cleanup() {
    rm -f "$COOKIE_JAR"
}
trap cleanup EXIT

# Step 1: Pre-fetch /login to obtain CSRF token and initial cookies
LOGIN_PAGE=$(curl --noproxy "*" -s -c "$COOKIE_JAR" "${BASE_URL}/login")
CSRF_TOKEN=$(echo "$LOGIN_PAGE" | grep 'name="_csrf"' | head -n 1 | sed -n 's/.*value="\([^"]*\)".*/\1/p')

if [ -z "$CSRF_TOKEN" ]; then
    echo "[-] ERROR: Failed to extract CSRF token from ${BASE_URL}/login" >&2
    exit 1
fi
echo "[+] Extracted CSRF token."

# Step 2: Post login credentials
LOGIN_RESP=$(curl --noproxy "*" -s -i -b "$COOKIE_JAR" -c "$COOKIE_JAR" \
    -H "X-CSRF-Token: ${CSRF_TOKEN}" \
    -X POST "${BASE_URL}/login" \
    --data-urlencode "_csrf=${CSRF_TOKEN}" \
    --data-urlencode "LoginForm[username]=${USERNAME}" \
    --data-urlencode "LoginForm[password]=${PASSWORD}" \
    --data-urlencode "LoginForm[rememberMe]=1")

if echo "$LOGIN_RESP" | grep -qi "_identity"; then
    echo "[+] SUCCESS: Credentials accepted, identity cookie granted!"
else
    echo "[-] ERROR: Login failed, no identity cookie found in response." >&2
    echo "$LOGIN_RESP" | head -n 25 >&2
    exit 1
fi

# Step 3: Access /backend/ and verify admin dashboard
BACKEND_PAGE=$(curl --noproxy "*" -s -L -b "$COOKIE_JAR" -c "$COOKIE_JAR" "${BASE_URL}/backend")

if echo "$BACKEND_PAGE" | grep -qiE "DotPlant2 administration|admin|Welcome to DotPlant2"; then
    echo "[+] SUCCESS: Successfully authenticated as '${USERNAME}' and verified backend admin access."
    exit 0
else
    echo "[-] ERROR: Login succeeded but backend admin marker not found." >&2
    exit 1
fi
