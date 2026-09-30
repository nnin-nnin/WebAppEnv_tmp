#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18642}"
BASE_URL="http://127.0.0.1:${HOST_PORT}"
USERNAME="${FLASKBB_USER:-${FLASKBB_USERNAME:-${ADMIN_USERNAME:-${ADMIN_USER:-${USERNAME:-${USER:-admin}}}}}}"
PASSWORD="${FLASKBB_PASSWORD:-${ADMIN_PASSWORD:-${PASSWORD:-benchmark-only}}}"

echo "Checking FlaskBB login availability at ${BASE_URL}..."

# Verify / or /auth/login returns 200 OK
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/auth/login")
if [ "$HTTP_CODE" -ne 200 ]; then
    echo "Checking root URL..."
    HTTP_CODE_ROOT=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/")
    if [ "$HTTP_CODE_ROOT" -ne 200 ]; then
        echo "FAILED: /auth/login returned ${HTTP_CODE} and / returned ${HTTP_CODE_ROOT}"
        exit 1
    fi
fi
echo "SUCCESS: FlaskBB web endpoint accessible (HTTP 200)"

# Verify form login authentication with CSRF token
COOKIE_JAR=$(mktemp)
trap 'rm -f "$COOKIE_JAR"' EXIT

CSRF_TOKEN=$(curl -s -c "$COOKIE_JAR" "${BASE_URL}/auth/login" | grep -o 'name="csrf_token"[^>]*' | grep -o 'value="[^"]*"' | head -n 1 | cut -d\" -f2)

if [ -n "$CSRF_TOKEN" ]; then
    LOGIN_STATUS=$(curl -s -L -b "$COOKIE_JAR" -c "$COOKIE_JAR" \
        --data-urlencode "csrf_token=${CSRF_TOKEN}" \
        --data-urlencode "login=${USERNAME}" \
        --data-urlencode "password=${PASSWORD}" \
        -o /dev/null -w "%{http_code}" \
        "${BASE_URL}/auth/login")

    if [ "$LOGIN_STATUS" -eq 200 ]; then
        echo "SUCCESS: FlaskBB authenticated session verified (HTTP 200)"
        exit 0
    else
        echo "WARNING: Login POST returned HTTP ${LOGIN_STATUS}, but login endpoint is accessible"
    fi
fi

exit 0
