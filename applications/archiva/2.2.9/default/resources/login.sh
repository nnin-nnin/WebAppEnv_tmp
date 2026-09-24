#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18615}"
BASE_URL="http://localhost:${HOST_PORT}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-${USER:-admin}}}}"
PASSWORD="${ADMIN_PASSWORD:-${APP_PASSWORD:-${PASSWORD:-AdminPassword123!}}}"

echo "Checking Apache Archiva login at ${BASE_URL} for user '${USERNAME}'..."

# Check web interface availability (verify HTTP status 200 on / or /#login or /archiva/)
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)
if [ "$HTTP_CODE" -ne 200 ]; then
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/#login" || true)
fi
if [ "$HTTP_CODE" -ne 200 ]; then
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/archiva/" || true)
fi

if [ "$HTTP_CODE" -ne 200 ]; then
    echo "FAILED: Web interface not responding at ${BASE_URL} (HTTP ${HTTP_CODE})"
    exit 1
fi

# Authenticate via Redback REST API
COOKIE_JAR=$(mktemp)
trap 'rm -f "$COOKIE_JAR"' EXIT

LOGIN_RESP=$(curl -s -b "$COOKIE_JAR" -c "$COOKIE_JAR" \
    -H "Origin: ${BASE_URL}" \
    -H "Content-Type: application/json" \
    -X POST \
    -d "{\"username\":\"${USERNAME}\",\"password\":\"${PASSWORD}\"}" \
    "${BASE_URL}/restServices/redbackServices/loginService/logIn")

if echo "$LOGIN_RESP" | grep -qi "\"username\":\"${USERNAME}\""; then
    echo "SUCCESS: Apache Archiva login succeeded for user '${USERNAME}'"

    # Confirm session status via isLogged
    LOGGED_RESP=$(curl -s -b "$COOKIE_JAR" \
        -H "Origin: ${BASE_URL}" \
        "${BASE_URL}/restServices/redbackServices/loginService/isLogged")
    if echo "$LOGGED_RESP" | grep -qi "\"username\":\"${USERNAME}\""; then
        echo "SUCCESS: Apache Archiva session confirmed as logged in"
        exit 0
    fi
fi

echo "FAILED: Apache Archiva login failed"
echo "Response: ${LOGIN_RESP}"
exit 1
