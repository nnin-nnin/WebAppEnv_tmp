#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18552}"
BASE_URL="${BASE_URL:-http://localhost:${HOST_PORT}}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-${USERNAME:-spadmin}}}}"
PASSWORD="${ADMIN_PASSWORD:-${APP_PASSWORD:-${PASSWORD:-spadmin}}}"

echo "Testing login for Seo Panel at ${BASE_URL} with user ${USERNAME}..."

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

LOGIN_PAGE="${BASE_URL}/login.php"
HTTP_CODE=$(curl -s -c "$TMP_DIR/cookies.txt" -b "$TMP_DIR/cookies.txt" -o "$TMP_DIR/login.html" -w "%{http_code}" "$LOGIN_PAGE")

if [ "$HTTP_CODE" -lt 200 ] || [ "$HTTP_CODE" -ge 400 ]; then
    echo "FAILED: Login page unreachable (HTTP $HTTP_CODE)"
    exit 1
fi

LOGIN_URL="${BASE_URL}/login.php"
do_login() {
    local user="$1"
    local pass="$2"
    rm -f "$TMP_DIR/dashboard.html"
    local resp_code
    resp_code=$(curl -s -L -c "$TMP_DIR/cookies.txt" -b "$TMP_DIR/cookies.txt" -o "$TMP_DIR/dashboard.html" -w "%{http_code}" \
        --data-urlencode "sec=login" \
        --data-urlencode "userName=${user}" \
        --data-urlencode "password=${pass}" \
        --data-urlencode "login=Login" \
        "$LOGIN_URL")

    if [ "$resp_code" -eq 200 ] && grep -qiE "(logout|admin-panel|adminpanel|User control panel|Seo Panel)" "$TMP_DIR/dashboard.html"; then
        local admin_code
        admin_code=$(curl -s -c "$TMP_DIR/cookies.txt" -b "$TMP_DIR/cookies.txt" -o "$TMP_DIR/admin.html" -w "%{http_code}" "${BASE_URL}/admin-panel.php")
        if [ "$admin_code" -eq 200 ]; then
            return 0
        fi
    fi
    return 1
}

if do_login "$USERNAME" "$PASSWORD"; then
    echo "SUCCESS: Successfully authenticated as ${USERNAME}"
    exit 0
fi

# Fallback: try default password spadmin if different
if [ "$PASSWORD" != "spadmin" ]; then
    echo "Retrying login with default password 'spadmin'..."
    if do_login "$USERNAME" "spadmin"; then
        echo "SUCCESS: Successfully authenticated as ${USERNAME} with default password"
        exit 0
    fi
fi

# Fallback: try AdminPassword123! if different
if [ "$PASSWORD" != "AdminPassword123!" ]; then
    echo "Retrying login with password 'AdminPassword123!'..."
    if do_login "$USERNAME" "AdminPassword123!"; then
        echo "SUCCESS: Successfully authenticated as ${USERNAME} with AdminPassword123!"
        exit 0
    fi
fi

echo "FAILED: Authentication failed for ${USERNAME}"
exit 1
