#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18563}"
BASE_URL="${BASE_URL:-http://localhost:${HOST_PORT}}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-${USERNAME:-admin}}}}"
PASSWORD="${ADMIN_PASSWORD:-${APP_PASSWORD:-${PASSWORD:-AdminPassword123!}}}"

echo "Testing login for Matomo at ${BASE_URL} with user ${USERNAME}..."

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

LOGIN_PAGE="${BASE_URL}/index.php?module=Login"
HTTP_CODE=$(curl -s -c "$TMP_DIR/cookies.txt" -b "$TMP_DIR/cookies.txt" -o "$TMP_DIR/login.html" -w "%{http_code}" "$LOGIN_PAGE")

if [ "$HTTP_CODE" -lt 200 ] || [ "$HTTP_CODE" -ge 400 ]; then
    echo "FAILED: Login page unreachable (HTTP $HTTP_CODE)"
    exit 1
fi

NONCE=$(grep -o 'id="login_form_nonce"[^>]*value="[^"]*"' "$TMP_DIR/login.html" 2>/dev/null | sed 's/.*value="//;s/".*//')
if [ -z "$NONCE" ]; then
    NONCE=$(grep -o 'name="form_nonce"[^>]*value="[^"]*"' "$TMP_DIR/login.html" 2>/dev/null | sed 's/.*value="//;s/".*//')
fi

if [ -z "$NONCE" ]; then
    echo "FAILED: Could not extract form_nonce"
    exit 1
fi

LOGIN_URL="${BASE_URL}/index.php?module=Login"
RESP_CODE=$(curl -s -L -c "$TMP_DIR/cookies.txt" -b "$TMP_DIR/cookies.txt" -o "$TMP_DIR/dashboard.html" -w "%{http_code}" \
    --data-urlencode "form_nonce=${NONCE}" \
    --data-urlencode "form_login=${USERNAME}" \
    --data-urlencode "form_password=${PASSWORD}" \
    --data-urlencode "submit=Sign in" \
    "$LOGIN_URL")

if [ "$RESP_CODE" -eq 200 ] && grep -qiE "(sign out|logout|dashboard|topmenu-login)" "$TMP_DIR/dashboard.html"; then
    echo "SUCCESS: Successfully authenticated as ${USERNAME} (HTTP $RESP_CODE)"
    exit 0
fi

if [ "$USERNAME" = "admin" ]; then
    echo "Retrying login with email admin@example.com..."
    NONCE=$(curl -s -c "$TMP_DIR/cookies.txt" -b "$TMP_DIR/cookies.txt" "$LOGIN_PAGE" | grep -o 'id="login_form_nonce"[^>]*value="[^"]*"' | sed 's/.*value="//;s/".*//')
    RESP_CODE=$(curl -s -L -c "$TMP_DIR/cookies.txt" -b "$TMP_DIR/cookies.txt" -o "$TMP_DIR/dashboard.html" -w "%{http_code}" \
        --data-urlencode "form_nonce=${NONCE}" \
        --data-urlencode "form_login=admin@example.com" \
        --data-urlencode "form_password=${PASSWORD}" \
        --data-urlencode "submit=Sign in" \
        "$LOGIN_URL")
    if [ "$RESP_CODE" -eq 200 ] && grep -qiE "(sign out|logout|dashboard|topmenu-login)" "$TMP_DIR/dashboard.html"; then
        echo "SUCCESS: Successfully authenticated with admin@example.com"
        exit 0
    fi
fi

echo "FAILED: Authentication failed for ${USERNAME} (HTTP $RESP_CODE)"
exit 1
