#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18556}"
BASE_URL="${BASE_URL:-http://localhost:${HOST_PORT}}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-admin@benchmark.local}}}"
PASSWORD="${ADMIN_PASSWORD:-${APP_PASSWORD:-AdminPassword123!}}"

echo "Testing login for Ghost at ${BASE_URL} with user ${USERNAME}..."

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

HTTP_CODE=$(curl -s -i -o "$TMP_DIR/response.txt" -w "%{http_code}" \
    -X POST "${BASE_URL}/ghost/api/admin/session" \
    -H "Content-Type: application/json" \
    -H "Origin: ${BASE_URL}" \
    -d "{\"username\":\"${USERNAME}\",\"password\":\"${PASSWORD}\"}")

if [ "$HTTP_CODE" -eq 201 ]; then
    echo "SUCCESS: Authentication succeeded with HTTP $HTTP_CODE"
    COOKIE=$(grep -i "set-cookie: ghost-admin-api-session=" "$TMP_DIR/response.txt" | sed 's/^[Ss]et-[Cc]ookie: //;s/;.*//' | tr -d '\r\n')
    if [ -n "$COOKIE" ]; then
        ME_CODE=$(curl -s -o /dev/null -w "%{http_code}" \
            -H "Cookie: ${COOKIE}" \
            "${BASE_URL}/ghost/api/admin/users/me/")
        if [ "$ME_CODE" -eq 200 ]; then
            echo "SUCCESS: Verified admin session via /ghost/api/admin/users/me/ (HTTP $ME_CODE)"
            exit 0
        fi
    fi
    exit 0
else
    echo "FAILED: Authentication failed for ${USERNAME} (HTTP $HTTP_CODE)"
    cat "$TMP_DIR/response.txt"
    exit 1
fi
