#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18541}"
BASE_URL="${BASE_URL:-http://localhost:${HOST_PORT}}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-${USERNAME:-admin}}}}"
PASSWORD="${ADMIN_PASSWORD:-${APP_PASSWORD:-${PASSWORD:-AdminPassword123!}}}"

echo "Testing login for InvoicePlane at ${BASE_URL} with user ${USERNAME}..."

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

LOGIN_PAGE="${BASE_URL}/sessions/login"
HTTP_CODE=$(curl -s -c "$TMP_DIR/cookies.txt" -b "$TMP_DIR/cookies.txt" -o "$TMP_DIR/login.html" -w "%{http_code}" "$LOGIN_PAGE")

if [ "$HTTP_CODE" -lt 200 ] || [ "$HTTP_CODE" -ge 400 ]; then
    echo "FAILED: Login page unreachable (HTTP $HTTP_CODE)"
    exit 1
fi

CSRF_TOKEN=$(grep 'ip_csrf_cookie' "$TMP_DIR/cookies.txt" 2>/dev/null | awk '{print $NF}')
if [ -z "$CSRF_TOKEN" ]; then
    CSRF_TOKEN=$(grep -A1 'name="_ip_csrf"' "$TMP_DIR/login.html" 2>/dev/null | grep 'value=' | sed 's/.*value="//;s/".*//')
fi

if [ -z "$CSRF_TOKEN" ]; then
    echo "FAILED: Could not extract CSRF token"
    exit 1
fi

LOGIN_URL="${BASE_URL}/index.php/sessions/login"
RESP_CODE=$(curl -s -L -c "$TMP_DIR/cookies.txt" -b "$TMP_DIR/cookies.txt" -o "$TMP_DIR/dashboard.html" -w "%{http_code}" \
    --data-urlencode "_ip_csrf=${CSRF_TOKEN}" \
    --data-urlencode "email=${USERNAME}" \
    --data-urlencode "password=${PASSWORD}" \
    --data-urlencode "btn_login=true" \
    "$LOGIN_URL")

if [ "$RESP_CODE" -eq 200 ] && grep -qiE "(logout|dashboard)" "$TMP_DIR/dashboard.html"; then
    echo "SUCCESS: Successfully authenticated as ${USERNAME} (HTTP $RESP_CODE)"
    exit 0
fi

if [ "$USERNAME" = "admin" ]; then
    echo "Retrying login with email admin@example.com..."
    CSRF_TOKEN=$(grep 'ip_csrf_cookie' "$TMP_DIR/cookies.txt" 2>/dev/null | awk '{print $NF}')
    RESP_CODE=$(curl -s -L -c "$TMP_DIR/cookies.txt" -b "$TMP_DIR/cookies.txt" -o "$TMP_DIR/dashboard.html" -w "%{http_code}" \
        --data-urlencode "_ip_csrf=${CSRF_TOKEN}" \
        --data-urlencode "email=admin@example.com" \
        --data-urlencode "password=${PASSWORD}" \
        --data-urlencode "btn_login=true" \
        "$LOGIN_URL")
    if [ "$RESP_CODE" -eq 200 ] && grep -qiE "(logout|dashboard)" "$TMP_DIR/dashboard.html"; then
        echo "SUCCESS: Successfully authenticated with admin@example.com"
        exit 0
    fi
fi

echo "FAILED: Authentication failed for ${USERNAME} (HTTP $RESP_CODE)"
exit 1
