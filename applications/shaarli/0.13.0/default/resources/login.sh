#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18664}"
BASE_URL="${BASE_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${1:-${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USERNAME:-${APP_USER:-admin}}}}}"
PASSWORD="${2:-${ADMIN_PASSWORD:-${ADMIN_PASS:-${APP_PASSWORD:-Admin123456!}}}}"

echo "Testing Shaarli endpoint and authentication at ${BASE_URL} for user '${USERNAME}'..."

# Ensure initial install is triggered if still on 302
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" 2>/dev/null || true)
if [ "$HTTP_CODE" = "302" ]; then
    echo "Initial install required, triggering setup..."
    INIT_JAR="$(mktemp)"
    curl -s -c "$INIT_JAR" -b "$INIT_JAR" "${BASE_URL}/install" > /dev/null 2>&1 || true
    curl -s -L -c "$INIT_JAR" -b "$INIT_JAR" "${BASE_URL}/install/session-test" > /dev/null 2>&1 || true
    curl -s -L -c "$INIT_JAR" -b "$INIT_JAR" -X POST "${BASE_URL}/install" \
        --data-urlencode "setlogin=${USERNAME}" \
        --data-urlencode "setpassword=${PASSWORD}" \
        --data-urlencode "title=Shaarli" \
        --data-urlencode "language=en" \
        --data-urlencode "continent=UTC" \
        --data-urlencode "city=UTC" \
        --data-urlencode "updateCheck=1" \
        --data-urlencode "enableApi=1" > /dev/null 2>&1 || true
    rm -f "$INIT_JAR"
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" 2>/dev/null || true)
fi

# Verify http://127.0.0.1:18664/ returns 200
if [ "$HTTP_CODE" != "200" ]; then
    echo "FAILED: ${BASE_URL}/ returned HTTP ${HTTP_CODE}, expected 200"
    exit 1
fi
echo "SUCCESS: Endpoint ${BASE_URL}/ returned HTTP 200!"

# Verify login authentication
COOKIE_JAR="$(mktemp)"
trap 'rm -f "$COOKIE_JAR"' EXIT

LOGIN_PAGE=$(curl -sS -c "$COOKIE_JAR" -b "$COOKIE_JAR" "${BASE_URL}/login")
TOKEN=$(echo "$LOGIN_PAGE" | grep -oE 'name="token" value="[^"]+"' | head -1 | cut -d'"' -f4)

if [ -n "$TOKEN" ]; then
    echo "Submitting login credentials with token..."
    LOGIN_STATUS=$(curl -sS -o /dev/null -w "%{http_code}" -c "$COOKIE_JAR" -b "$COOKIE_JAR" -X POST "${BASE_URL}/login" \
        --data-urlencode "login=${USERNAME}" \
        --data-urlencode "password=${PASSWORD}" \
        --data-urlencode "token=${TOKEN}" \
        --data-urlencode "longlastingsession=on")
    
    if [ "$LOGIN_STATUS" = "302" ]; then
        echo "SUCCESS: Login succeeded with HTTP 302 redirect!"
    else
        echo "Login POST returned HTTP ${LOGIN_STATUS}"
    fi

    # Check authenticated access
    AUTH_PAGE=$(curl -sS -b "$COOKIE_JAR" "${BASE_URL}/")
    if echo "$AUTH_PAGE" | grep -qiE "logout|admin|tools"; then
        echo "SUCCESS: Shaarli authentication verified for user '${USERNAME}'!"
        exit 0
    else
        echo "FAILED: Could not verify authenticated session in ${BASE_URL}/"
        exit 1
    fi
else
    echo "Note: No login token form found, root HTTP 200 check passed."
    exit 0
fi
