#!/usr/bin/env bash
set -eo pipefail

HOST_PORT="${HOST_PORT:-18875}"
BASE_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"

echo "[*] Testing X2CRM authentication at ${BASE_URL}..."

COOKIE_JAR=$(mktemp)
trap 'rm -f "$COOKIE_JAR"' EXIT

# Step 1: Request login page to get session cookie and CSRF token
LOGIN_PAGE=$(curl --noproxy "*" -s -c "$COOKIE_JAR" "${BASE_URL}/index.php/site/login")

CSRF_TOKEN=$(grep -o 'value="[^"]*" name="YII_CSRF_TOKEN"' <<< "$LOGIN_PAGE" | head -n1 | sed -E 's/value="([^"]+)" name="YII_CSRF_TOKEN"/\1/' || true)

if [ -z "$CSRF_TOKEN" ]; then
    CSRF_TOKEN=$(grep -o 'name="YII_CSRF_TOKEN" value="[^"]*"' <<< "$LOGIN_PAGE" | head -n1 | sed -E 's/name="YII_CSRF_TOKEN" value="([^"]+)"/\1/' || true)
fi

if [ -z "$CSRF_TOKEN" ]; then
    echo "[-] FAILED: Could not extract YII_CSRF_TOKEN from login page"
    exit 1
fi

echo "[*] Obtained CSRF token: ${CSRF_TOKEN:0:16}..."

# Step 2: Submit login credentials
LOGIN_RESPONSE=$(curl --noproxy "*" -s -i -b "$COOKIE_JAR" -c "$COOKIE_JAR" \
    -X POST \
    --data-urlencode "YII_CSRF_TOKEN=${CSRF_TOKEN}" \
    --data-urlencode "LoginForm[username]=admin" \
    --data-urlencode "LoginForm[password]=AdminPassword123!" \
    --data-urlencode "LoginForm[rememberMe]=0" \
    --data-urlencode "login-button=Sign In" \
    "${BASE_URL}/index.php/site/login")

HTTP_STATUS=$(echo "$LOGIN_RESPONSE" | head -n 1 | awk '{print $2}')

if [ "$HTTP_STATUS" -ne 302 ] && [ "$HTTP_STATUS" -ne 200 ]; then
    echo "[-] FAILED: Login failed with HTTP status $HTTP_STATUS"
    exit 1
fi

# Step 3: Access authenticated profile page
PROFILE_PAGE=$(curl --noproxy "*" -sL -b "$COOKIE_JAR" "${BASE_URL}/index.php/profile/1")

if [[ "$PROFILE_PAGE" =~ "X2CRM" ]] && ([[ "$PROFILE_PAGE" =~ "Logout" ]] || [[ "$PROFILE_PAGE" =~ "profile" ]]); then
    echo "[+] SUCCESS: Successfully logged in to X2CRM as admin!"
    exit 0
else
    echo "[-] FAILED: Could not find authenticated session markers on profile page"
    exit 1
fi
