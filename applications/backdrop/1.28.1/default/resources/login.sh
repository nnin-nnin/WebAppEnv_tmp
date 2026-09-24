#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18571}"
BASE_URL="${BASE_URL:-http://localhost:${HOST_PORT}}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${BACKDROP_USER:-${APP_USER:-admin}}}}"
PASSWORD="${ADMIN_PASSWORD:-${ADMIN_PASS:-${BACKDROP_PASSWORD:-${APP_PASSWORD:-admin123}}}}"

echo "Testing login for Backdrop CMS at ${BASE_URL} with user ${USERNAME}..."

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

LOGIN_PAGE="${BASE_URL}/user/login"
HTTP_CODE=$(curl -s -c "$TMP_DIR/cookies.txt" -b "$TMP_DIR/cookies.txt" -o "$TMP_DIR/login.html" -w "%{http_code}" "$LOGIN_PAGE")

if [ "$HTTP_CODE" -lt 200 ] || [ "$HTTP_CODE" -ge 400 ]; then
    echo "FAILED: Login page unreachable (HTTP $HTTP_CODE)"
    exit 1
fi

FORM_BUILD_ID=$(grep 'name="form_build_id"' "$TMP_DIR/login.html" | head -n1 | sed -E 's/.*value="([^"]+)".*/\1/')
if [ -z "$FORM_BUILD_ID" ]; then
    echo "FAILED: Could not extract form_build_id"
    exit 1
fi

RESP_CODE=$(curl -s -L -c "$TMP_DIR/cookies.txt" -b "$TMP_DIR/cookies.txt" -o "$TMP_DIR/dashboard.html" -w "%{http_code}" \
    --data-urlencode "name=${USERNAME}" \
    --data-urlencode "pass=${PASSWORD}" \
    --data-urlencode "form_build_id=${FORM_BUILD_ID}" \
    --data-urlencode "form_id=user_login" \
    --data-urlencode "op=Log in" \
    "$LOGIN_PAGE")

if [ "$RESP_CODE" -eq 200 ] && grep -qiE "(Log out|Dashboard|admin-bar|user-counter-value)" "$TMP_DIR/dashboard.html"; then
    echo "SUCCESS: Successfully authenticated as ${USERNAME} (HTTP $RESP_CODE)"
    exit 0
else
    echo "FAILED: Authentication failed for ${USERNAME} (HTTP $RESP_CODE)"
    exit 1
fi
