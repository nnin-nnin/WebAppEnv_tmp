#!/usr/bin/env bash
set -euo pipefail

APP_URL="${APP_URL:-http://127.0.0.1:18810}"
USERNAME="${ADMIN_USERNAME:-${USERNAME:-admin}}"
PASSWORD="${ADMIN_PASSWORD:-${PASSWORD:-AdminPassword123!}}"

COOKIE_JAR="$(mktemp)"
LOGIN_PAGE="$(mktemp)"
LOGIN_RES="$(mktemp)"
trap 'rm -f "$COOKIE_JAR" "$LOGIN_PAGE" "$LOGIN_RES"' EXIT

echo "Acquiring login page and test cookie from ${APP_URL}/couch/login.php..."
curl -s -c "$COOKIE_JAR" "${APP_URL}/couch/login.php" > "$LOGIN_PAGE"

echo "Posting login credentials for ${USERNAME}..."
HTTP_CODE=$(curl -s -o "$LOGIN_RES" -w "%{http_code}" \
    -b "$COOKIE_JAR" -c "$COOKIE_JAR" \
    -X POST "${APP_URL}/couch/login.php" \
    -d "k_user_name=${USERNAME}" \
    -d "k_user_pwd=${PASSWORD}" \
    -d "k_cookie_test=1" \
    -d "k_login=1")

if [ "$HTTP_CODE" = "302" ] || [ "$HTTP_CODE" = "200" ]; then
    # Verify authentication cookie or access to admin panel
    if grep -q "couchcms_" "$COOKIE_JAR"; then
        PANEL_HTML=$(curl -s -L -b "$COOKIE_JAR" "${APP_URL}/couch/index.php")
        if echo "$PANEL_HTML" | grep -qiE "logout|admin|couchcms"; then
            echo "Login successful for user: ${USERNAME}"
            exit 0
        fi
    fi
fi

echo "Login failed for user: ${USERNAME}. HTTP code: ${HTTP_CODE}"
cat "$LOGIN_RES"
exit 1
