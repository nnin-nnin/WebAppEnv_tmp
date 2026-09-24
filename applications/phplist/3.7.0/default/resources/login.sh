#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18568}"
BASE_URL="${BASE_URL:-http://localhost:${HOST_PORT}}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-${USERNAME:-admin}}}}"
PASSWORD="${ADMIN_PASSWORD:-${APP_PASSWORD:-${PASSWORD:-AdminPassword123!}}}"

echo "Testing login for phpList at ${BASE_URL} with user ${USERNAME}..."

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

LOGIN_PAGE="${BASE_URL}/lists/admin/"
HTTP_CODE=$(curl -s -c "$TMP_DIR/cookies.txt" -b "$TMP_DIR/cookies.txt" -o "$TMP_DIR/login.html" -w "%{http_code}" "$LOGIN_PAGE")

if [ "$HTTP_CODE" -lt 200 ] || [ "$HTTP_CODE" -ge 400 ]; then
    echo "FAILED: Login page unreachable (HTTP $HTTP_CODE)"
    exit 1
fi

LOGIN_URL="${BASE_URL}/lists/admin/"
RESP_CODE=$(curl -s -L -c "$TMP_DIR/cookies.txt" -b "$TMP_DIR/cookies.txt" -o "$TMP_DIR/dashboard.html" -w "%{http_code}" \
    --data-urlencode "page=home" \
    --data-urlencode "login=${USERNAME}" \
    --data-urlencode "password=${PASSWORD}" \
    --data-urlencode "process=Continue" \
    "$LOGIN_URL")

if [ "$RESP_CODE" -eq 200 ] && grep -qiE "(logout|dashboard)" "$TMP_DIR/dashboard.html"; then
    echo "SUCCESS: Successfully authenticated as ${USERNAME} (HTTP $RESP_CODE)"
    exit 0
fi

echo "FAILED: Authentication failed for ${USERNAME} (HTTP $RESP_CODE)"
exit 1
