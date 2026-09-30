#!/usr/bin/env bash
set -eo pipefail

HOST_PORT="${HOST_PORT:-18807}"
BASE_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"

echo "[*] Testing ClipperCMS manager authentication at ${BASE_URL}/manager/..."

COOKIE_JAR=$(mktemp)
trap 'rm -f "$COOKIE_JAR"' EXIT

# Step 1: Request manager login page to get initial session cookie
curl --noproxy "*" -s -c "$COOKIE_JAR" "${BASE_URL}/manager/" > /dev/null

# Step 2: Submit login credentials with ajax=1 for clean redirect URL output
LOGIN_RESPONSE=$(curl --noproxy "*" -s -b "$COOKIE_JAR" -c "$COOKIE_JAR" \
    -X POST \
    -d "username=admin" \
    -d "password=AdminPassword123!" \
    -d "rememberme=0" \
    -d "ajax=1" \
    "${BASE_URL}/manager/processors/login.processor.php")

if echo "$LOGIN_RESPONSE" | grep -qi "Location:.*manager"; then
    echo "[+] SUCCESS: Credentials accepted! Redirected to manager."
else
    echo "[-] FAILED: Unexpected login response: $LOGIN_RESPONSE"
    exit 1
fi

# Step 3: Access manager dashboard with authenticated session cookie
DASHBOARD_HTML=$(curl --noproxy "*" -sL -b "$COOKIE_JAR" "${BASE_URL}/manager/index.php")

if echo "$DASHBOARD_HTML" | grep -qi "ClipperCMS" && echo "$DASHBOARD_HTML" | grep -qi "frameset\|tree\|welcome\|logout"; then
    echo "[+] SUCCESS: Successfully accessed ClipperCMS manager dashboard!"
    exit 0
else
    echo "[-] FAILED: Could not find manager dashboard elements in response."
    exit 1
fi
