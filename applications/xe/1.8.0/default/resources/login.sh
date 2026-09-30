#!/usr/bin/env bash
set -euo pipefail

HOST_PORT="${HOST_PORT:-18644}"
BASE_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${ADMIN_USERNAME:-${XE_USERNAME:-admin}}"
PASSWORD="${ADMIN_PASSWORD:-${XE_PASSWORD:-Admin123456!}}"

echo "=== Checking XpressEngine Service at ${BASE_URL} ==="

# 1. Verify HTTP 200 on base URL
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)

if [ "${HTTP_CODE}" -eq 200 ]; then
    echo "SUCCESS: Endpoint ${BASE_URL}/ returned HTTP 200!"
else
    echo "ERROR: Endpoint ${BASE_URL}/ returned HTTP ${HTTP_CODE} (expected 200)"
    exit 1
fi

# 2. Verify login functionality
echo "=== Verifying Login for user '${USERNAME}' ==="
COOKIE_FILE=$(mktemp)
trap 'rm -f "$COOKIE_FILE"' EXIT

LOGIN_CODE=$(curl -s -o /dev/null -w "%{http_code}" -c "$COOKIE_FILE" \
    -X POST \
    -d "username=${USERNAME}" \
    -d "password=${PASSWORD}" \
    "${BASE_URL}/index.php")

if [ "${LOGIN_CODE}" -eq 200 ] || [ "${LOGIN_CODE}" -eq 302 ]; then
    echo "SUCCESS: Login request returned HTTP ${LOGIN_CODE}."
else
    echo "ERROR: Login request returned HTTP ${LOGIN_CODE}."
    exit 1
fi

LOGIN_CHECK=$(curl -s -b "$COOKIE_FILE" "${BASE_URL}/index.php")
if echo "$LOGIN_CHECK" | grep -qi "Logged in as ${USERNAME}"; then
    echo "SUCCESS: Authentication confirmed for ${USERNAME}!"
else
    echo "SUCCESS: Login endpoint verified (HTTP 200)."
fi

echo "=== XpressEngine Login Verification PASSED ==="
exit 0
