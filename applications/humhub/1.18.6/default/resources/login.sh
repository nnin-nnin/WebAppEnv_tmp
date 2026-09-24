#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18564}"
BASE_URL="${BASE_URL:-http://localhost:${HOST_PORT}}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${HUMHUB_USER:-${APP_USER:-admin}}}}"
PASSWORD="${ADMIN_PASSWORD:-${ADMIN_PASS:-${HUMHUB_PASSWORD:-${APP_PASSWORD:-AdminPassword123!}}}}"

echo "Testing login for HumHub at ${BASE_URL} with user ${USERNAME}..."

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

LOGIN_PAGE="${BASE_URL}/user/auth/login"
HTTP_CODE=$(curl -s -c "$TMP_DIR/cookies.txt" -b "$TMP_DIR/cookies.txt" -o "$TMP_DIR/login.html" -w "%{http_code}" "$LOGIN_PAGE")

if [ "$HTTP_CODE" -lt 200 ] || [ "$HTTP_CODE" -ge 400 ]; then
    echo "FAILED: Login page unreachable (HTTP $HTTP_CODE)"
    exit 1
fi

CSRF_TOKEN=$(grep 'name="_csrf"' "$TMP_DIR/login.html" | head -n1 | sed -E 's/.*value="([^"]+)".*/\1/')
if [ -z "$CSRF_TOKEN" ]; then
    echo "FAILED: Could not extract CSRF token"
    exit 1
fi

RESP_CODE=$(curl -s -L -c "$TMP_DIR/cookies.txt" -b "$TMP_DIR/cookies.txt" -o "$TMP_DIR/dashboard.html" -w "%{http_code}" \
    --data-urlencode "_csrf=${CSRF_TOKEN}" \
    --data-urlencode "Login[username]=${USERNAME}" \
    --data-urlencode "Login[password]=${PASSWORD}" \
    --data-urlencode "Login[rememberMe]=1" \
    "$LOGIN_PAGE")

if [ "$RESP_CODE" -eq 200 ] && grep -qiE "(logout|dashboard|account-top-menu|Sys Admin)" "$TMP_DIR/dashboard.html"; then
    echo "SUCCESS: Successfully authenticated as ${USERNAME} (HTTP $RESP_CODE)"
    exit 0
else
    echo "FAILED: Authentication failed for ${USERNAME} (HTTP $RESP_CODE)"
    exit 1
fi
