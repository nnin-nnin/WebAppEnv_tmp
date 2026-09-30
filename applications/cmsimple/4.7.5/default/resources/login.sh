#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18753}"
BASE_URL="http://127.0.0.1:${HOST_PORT}"
ADMIN_USER="${ADMIN_USER:-${ADMIN_USERNAME:-admin}}"
ADMIN_PASSWORD="${ADMIN_PASSWORD:-${ADMIN_PASS:-test}}"

echo "Checking CMSimple accessibility at ${BASE_URL}/..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/")

if [ "$HTTP_CODE" -ne 200 ]; then
    echo "FAILED: CMSimple root endpoint returned HTTP $HTTP_CODE (expected 200)"
    exit 1
fi

echo "SUCCESS: CMSimple root endpoint returned HTTP $HTTP_CODE"

echo "Verifying CMSimple authentication..."
COOKIE_JAR=$(mktemp)
trap 'rm -f "$COOKIE_JAR"' EXIT

LOGIN_RESP=$(curl -s -i -c "$COOKIE_JAR" \
    -d "login=true&user=${ADMIN_USER}&passwd=${ADMIN_PASSWORD}&submit=Login" \
    "${BASE_URL}/?login")

POST_CODE=$(echo "$LOGIN_RESP" | grep -m 1 "^HTTP/" | awk '{print $2}')

if [ "$POST_CODE" -ne 200 ]; then
    echo "FAILED: Login request returned HTTP $POST_CODE"
    exit 1
fi

if echo "$LOGIN_RESP" | grep -qi "logout"; then
    echo "SUCCESS: Admin login verified (found logout link in response)"
elif grep -qi "status" "$COOKIE_JAR"; then
    echo "SUCCESS: Admin session cookie set successfully"
else
    echo "FAILED: Admin authentication not confirmed in response"
    exit 1
fi

echo "Login check PASSED!"
exit 0
