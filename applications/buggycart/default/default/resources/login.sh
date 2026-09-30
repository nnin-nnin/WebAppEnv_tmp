#!/usr/bin/env bash
set -eo pipefail

HOST_PORT="${HOST_PORT:-18849}"
BASE_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${ADMIN_USERNAME:-admin}"
PASSWORD="${ADMIN_PASSWORD:-AdminPassword123!}"

echo "[*] Testing login for buggycart at ${BASE_URL}..."

COOKIE_JAR="$(mktemp)"
cleanup() {
    rm -f "$COOKIE_JAR"
}
trap cleanup EXIT

ADMIN_LOGIN_URL="${BASE_URL%/}/admin/index.php?route=common/login"

# Step 1: Request admin login page to initialize session
curl --noproxy "*" -s -c "$COOKIE_JAR" -b "$COOKIE_JAR" "$ADMIN_LOGIN_URL" > /dev/null

# Step 2: Submit login credentials
LOGIN_RESP="$(curl --noproxy "*" -s -i -c "$COOKIE_JAR" -b "$COOKIE_JAR" \
    -X POST "$ADMIN_LOGIN_URL" \
    --data-urlencode "username=${USERNAME}" \
    --data-urlencode "password=${PASSWORD}")"

LOCATION_HDR="$(echo "$LOGIN_RESP" | grep -i '^Location:' | tr -d '\r\n' || true)"

if [[ "$LOCATION_HDR" =~ user_token=([a-zA-Z0-9]+) ]]; then
    USER_TOKEN="${BASH_REMATCH[1]}"
    echo "[+] Extracted admin user_token: ${USER_TOKEN}"
else
    echo "[-] ERROR: Admin authentication failed; redirect token not found." >&2
    echo "$LOGIN_RESP" | head -n 30 >&2
    exit 1
fi

# Step 3: Access admin dashboard with user_token
DASHBOARD_URL="${BASE_URL%/}/admin/index.php?route=common/dashboard&user_token=${USER_TOKEN}"
DASHBOARD_PAGE="$(curl --noproxy "*" -s -L -c "$COOKIE_JAR" -b "$COOKIE_JAR" "$DASHBOARD_URL")"

if echo "$DASHBOARD_PAGE" | grep -qiE "Dashboard|route=common/logout"; then
    echo "[+] SUCCESS: Successfully authenticated as '${USERNAME}' and verified admin dashboard access."
    exit 0
else
    echo "[-] ERROR: Login succeeded but admin dashboard marker not found." >&2
    exit 1
fi
