#!/usr/bin/env bash
set -euo pipefail

APP_URL="${APP_URL:-http://127.0.0.1:18835}"
USERNAME="${ADMIN_USERNAME:-admin}"
PASSWORD="${ADMIN_PASSWORD:-AdminPassword123!}"

COOKIE_FILE="$(mktemp)"
trap 'rm -f "$COOKIE_FILE"' EXIT

echo "=== Attempting login to JiZhiCMS ==="
echo "Target URL: ${APP_URL}/index.php/admins/Login/index"
echo "Username: ${USERNAME}"

# Step 1: Request login page to initialize session
LOGIN_PAGE=$(curl -s -S -i -c "$COOKIE_FILE" -b "$COOKIE_FILE" "${APP_URL}/index.php/admins/Login/index.html")
HTTP_STATUS=$(echo "$LOGIN_PAGE" | grep -iE "^HTTP/" | tail -n1 | awk '{print $2}')

if [ "$HTTP_STATUS" != "200" ] && [ "$HTTP_STATUS" != "302" ]; then
    echo "ERROR: Failed to reach login page at ${APP_URL}/index.php/admins/Login/index.html, HTTP status: ${HTTP_STATUS}"
    exit 1
fi

# Step 2: Calculate MD5 of password (JiZhiCMS frontend sends md5(password))
if [ "${#PASSWORD}" -eq 32 ] && [[ "$PASSWORD" =~ ^[0-9a-fA-F]{32}$ ]]; then
    PASS_MD5="$PASSWORD"
elif command -v python3 >/dev/null 2>&1; then
    PASS_MD5=$(python3 -c "import hashlib, sys; sys.stdout.write(hashlib.md5(sys.argv[1].encode('utf-8')).hexdigest())" "$PASSWORD")
elif command -v md5sum >/dev/null 2>&1; then
    PASS_MD5=$(printf "%s" "$PASSWORD" | md5sum | awk '{print $1}')
elif command -v md5 >/dev/null 2>&1; then
    PASS_MD5=$(printf "%s" "$PASSWORD" | md5)
else
    PASS_MD5=$(printf "%s" "$PASSWORD" | openssl dgst -md5 | awk '{print $NF}')
fi

# Step 3: Submit login credentials
LOGIN_RESP=$(curl -s -S -c "$COOKIE_FILE" -b "$COOKIE_FILE" \
    -X POST \
    -d "username=${USERNAME}" \
    -d "password=${PASS_MD5}" \
    "${APP_URL}/index.php/admins/Login/index")

if ! echo "$LOGIN_RESP" | grep -iq '"code":0'; then
    echo "ERROR: JiZhiCMS login failed!"
    echo "Response: ${LOGIN_RESP}"
    exit 1
fi

# Step 4: Verify authenticated session on admin dashboard
DASHBOARD=$(curl -s -S -L -c "$COOKIE_FILE" -b "$COOKIE_FILE" "${APP_URL}/index.php/admins/Index/index")

if echo "$DASHBOARD" | grep -iqE "loginout|Login/loginout|cleanCache|jzicon|后台管理"; then
    echo "SUCCESS: JiZhiCMS administrator login successful and verified via dashboard access!"
    exit 0
else
    echo "ERROR: Login verification failed. Dashboard content did not contain expected administrative markers."
    echo "$DASHBOARD" | head -n 40
    exit 1
fi
