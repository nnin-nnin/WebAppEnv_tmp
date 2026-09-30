#!/usr/bin/env bash
set -euo pipefail

HOST_PORT="${HOST_PORT:-18873}"
APP_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${ADMIN_USERNAME:-admin}"
PASSWORD="${ADMIN_PASSWORD:-AdminPassword123!}"

COOKIE_FILE="$(mktemp)"
trap 'rm -f "$COOKIE_FILE"' EXIT

echo "=== Attempting login to WackoWiki ==="
echo "URL: ${APP_URL}/Login"
echo "User: ${USERNAME}"

# Step 1: Fetch login page to initiate session and obtain cookies and _nonce
LOGIN_HTML=$(curl -s -S -L -c "$COOKIE_FILE" -b "$COOKIE_FILE" "${APP_URL}/Login")

NONCE=$(echo "$LOGIN_HTML" | python3 -c '
import sys, re
html = sys.stdin.read()
m = re.search(r"name=[\x27\"]_nonce[\x27\"]\s+value=[\x27\"]([^\x27\"]+)[\x27\"]", html)
if m:
    print(m.group(1))
' || true)

if [ -n "$NONCE" ]; then
    echo "Extracted login nonce: ${NONCE}"
else
    echo "WARNING: Could not extract _nonce, proceeding without it"
    NONCE=""
fi

# Step 2: Post login credentials
LOGIN_RESP=$(curl -s -S -i -c "$COOKIE_FILE" -b "$COOKIE_FILE" \
    -X POST \
    -d "_action=login" \
    -d "_nonce=${NONCE}" \
    -d "user_name=${USERNAME}" \
    -d "password=${PASSWORD}" \
    "${APP_URL}/Login")

# Step 3: Check response or fetch account / homepage with cookies
ACCOUNT_PAGE=$(curl -s -S -L -c "$COOKIE_FILE" -b "$COOKIE_FILE" "${APP_URL}/")

if echo "$LOGIN_RESP" | grep -qiE "Location: .*(Users|admin|account|logout)" || echo "$ACCOUNT_PAGE" | grep -qiE "action=logout|action=clearcookies|Users/${USERNAME}|${USERNAME}"; then
    echo "SUCCESS: WackoWiki admin login verified!"
    exit 0
else
    echo "ERROR: WackoWiki admin login failed. Login response snippet:"
    echo "$LOGIN_RESP" | head -n 30
    exit 1
fi
