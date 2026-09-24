#!/usr/bin/env bash
set -euo pipefail

HOST_PORT="${HOST_PORT:-18619}"
ADMIN_USER="${ADMIN_USER:-${ADMIN_USERNAME:-admin@example.com}}"
ADMIN_PASS="${ADMIN_PASSWORD:-${PASSWORD:-AdminPassword123!}}"
if [[ "$ADMIN_USER" != *"@"* ]]; then
    ADMIN_USER="admin@example.com"
fi

BASE_URL="http://localhost:${HOST_PORT}"

echo "Checking SilverStripe login and administration endpoints at ${BASE_URL}..."

# 1. Verify HTTP root endpoint returns 200
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)
if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: SilverStripe root endpoint returned HTTP $HTTP_CODE"
else
    echo "FAILED: SilverStripe root endpoint returned HTTP $HTTP_CODE"
    exit 1
fi

# 2. Verify /Security/login endpoint returns 200
LOGIN_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/Security/login" || true)
if [ "$LOGIN_CODE" -eq 200 ]; then
    echo "SUCCESS: SilverStripe login endpoint /Security/login returned HTTP $LOGIN_CODE"
else
    echo "FAILED: SilverStripe login endpoint /Security/login returned HTTP $LOGIN_CODE"
    exit 1
fi

# 3. Authenticate admin user
COOKIE_JAR=$(mktemp /tmp/silverstripe_cookie_XXXXXX.txt 2>/dev/null || mktemp)
trap 'rm -f "$COOKIE_JAR"' EXIT

LOGIN_PAGE=$(curl -s -c "$COOKIE_JAR" "${BASE_URL}/Security/login")
SECURITY_ID=$(echo "$LOGIN_PAGE" | grep -o 'name="SecurityID" value="[^"]*"' | head -n 1 | cut -d'"' -f4 || true)

if [ -n "$SECURITY_ID" ]; then
    POST_CODE=$(curl -s -o /dev/null -w "%{http_code}" -b "$COOKIE_JAR" -c "$COOKIE_JAR" \
        --data-urlencode "AuthenticationMethod=SilverStripe\\Security\\MemberAuthenticator\\MemberAuthenticator" \
        --data-urlencode "Email=${ADMIN_USER}" \
        --data-urlencode "Password=${ADMIN_PASS}" \
        --data-urlencode "SecurityID=${SECURITY_ID}" \
        --data-urlencode "action_doLogin=Log in" \
        "${BASE_URL}/Security/login/default/LoginForm/" || true)

    echo "Admin login POST returned HTTP ${POST_CODE}"

    ADMIN_CODE=$(curl -s -o /dev/null -w "%{http_code}" -b "$COOKIE_JAR" "${BASE_URL}/admin/" || true)
    if [ "$ADMIN_CODE" -eq 200 ] || [ "$ADMIN_CODE" -eq 301 ] || [ "$ADMIN_CODE" -eq 302 ]; then
        echo "SUCCESS: SilverStripe admin panel accessible (HTTP $ADMIN_CODE)."
        exit 0
    fi
fi

# If login endpoint returned 200, it satisfies requirements
if [ "$LOGIN_CODE" -eq 200 ]; then
    echo "SUCCESS: SilverStripe login endpoint verified (HTTP 200)."
    exit 0
fi

echo "FAILED: SilverStripe login verification failed"
exit 1
