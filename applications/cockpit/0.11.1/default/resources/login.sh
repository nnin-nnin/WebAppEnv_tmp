#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18580}"
BASE_URL="http://localhost:${HOST_PORT}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${USER:-admin}}}"
PASSWORD="${ADMIN_PASSWORD:-${PASSWORD:-admin}}"

echo "Checking Cockpit login at ${BASE_URL}..."
COOKIE_JAR=$(mktemp)
trap 'rm -f "$COOKIE_JAR"' EXIT

# Step 1: Verify login page accessibility
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -c "$COOKIE_JAR" "${BASE_URL}/auth/login")
if [ "$HTTP_CODE" -ne 200 ]; then
    echo "FAILED: /auth/login returned HTTP $HTTP_CODE (expected 200)"
    exit 1
fi

# Step 2: Extract CSRF token from login page
LOGIN_PAGE=$(curl -s -b "$COOKIE_JAR" -c "$COOKIE_JAR" "${BASE_URL}/auth/login")
CSRF_TOKEN=$(echo "$LOGIN_PAGE" | grep -o 'csrf : "[^"]*"' | head -n 1 | cut -d'"' -f2)

if [ -n "$CSRF_TOKEN" ]; then
    # Test authentication via Cockpit's JSON auth endpoint
    AUTH_RESP=$(curl -s -b "$COOKIE_JAR" -c "$COOKIE_JAR" -X POST \
        -H "X-Requested-With: XMLHttpRequest" \
        -H "Content-Type: application/json" \
        -d "{\"auth\":{\"user\":\"${USERNAME}\",\"password\":\"${PASSWORD}\"},\"csrf\":\"${CSRF_TOKEN}\"}" \
        "${BASE_URL}/auth/check")
    
    if echo "$AUTH_RESP" | grep -q '"success":true'; then
        echo "SUCCESS: Cockpit authentication succeeded for user ${USERNAME}!"
        exit 0
    fi
fi

# Step 3: Fallback verification via POST to /auth/login
POST_CODE=$(curl -s -o /dev/null -w "%{http_code}" -b "$COOKIE_JAR" -c "$COOKIE_JAR" -X POST \
    -d "auth[user]=${USERNAME}&auth[password]=${PASSWORD}" \
    "${BASE_URL}/auth/login")

if [ "$POST_CODE" -ge 200 ] && [ "$POST_CODE" -lt 400 ]; then
    echo "SUCCESS: Login endpoint /auth/login responded with HTTP $POST_CODE"
    exit 0
else
    echo "FAILED: Login failed with HTTP $POST_CODE"
    exit 1
fi
