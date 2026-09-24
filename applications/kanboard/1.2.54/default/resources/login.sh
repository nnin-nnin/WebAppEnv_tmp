#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18532}"
BASE_URL="${BASE_URL:-http://localhost:${HOST_PORT}}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-admin}}}"
PASSWORD="${ADMIN_PASSWORD:-${APP_PASSWORD:-admin}}"

echo "Testing login for Kanboard at ${BASE_URL} with user ${USERNAME}..."

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

# Fetch login page and extract CSRF token and cookies
HTTP_CODE=$(curl -s -c "$TMP_DIR/cookie.txt" -b "$TMP_DIR/cookie.txt" -o "$TMP_DIR/login.html" -w "%{http_code}" "${BASE_URL}/login")

if [ "$HTTP_CODE" -lt 200 ] || [ "$HTTP_CODE" -ge 400 ]; then
    echo "FAILED: Login page unreachable (HTTP $HTTP_CODE)"
    exit 1
fi

CSRF_TOKEN=$(grep -o 'name="csrf_token" value="[^"]*"' "$TMP_DIR/login.html" | sed 's/name="csrf_token" value="//;s/"//' | head -n 1)

if [ -z "$CSRF_TOKEN" ]; then
    echo "FAILED: Could not extract CSRF token from login page"
    exit 1
fi

# Submit login form
LOGIN_CODE=$(curl -s -L -c "$TMP_DIR/cookie.txt" -b "$TMP_DIR/cookie.txt" -o "$TMP_DIR/dashboard.html" -w "%{http_code}" \
    --data-urlencode "csrf_token=${CSRF_TOKEN}" \
    --data-urlencode "username=${USERNAME}" \
    --data-urlencode "password=${PASSWORD}" \
    "${BASE_URL}/login/check")

if [ "$LOGIN_CODE" -eq 200 ] && grep -qiE "(logout|dashboard|Sign out)" "$TMP_DIR/dashboard.html"; then
    echo "SUCCESS: Successfully authenticated as ${USERNAME} (HTTP $LOGIN_CODE)"
    exit 0
else
    # Fallback to default password 'admin' if custom password failed
    if [ "$PASSWORD" != "admin" ]; then
        echo "Retrying with default password 'admin'..."
        curl -s -c "$TMP_DIR/cookie2.txt" -b "$TMP_DIR/cookie2.txt" -o "$TMP_DIR/login2.html" "${BASE_URL}/login"
        CSRF_TOKEN2=$(grep -o 'name="csrf_token" value="[^"]*"' "$TMP_DIR/login2.html" | sed 's/name="csrf_token" value="//;s/"//' | head -n 1)
        LOGIN_CODE2=$(curl -s -L -c "$TMP_DIR/cookie2.txt" -b "$TMP_DIR/cookie2.txt" -o "$TMP_DIR/dashboard2.html" -w "%{http_code}" \
            --data-urlencode "csrf_token=${CSRF_TOKEN2}" \
            --data-urlencode "username=${USERNAME}" \
            --data-urlencode "password=admin" \
            "${BASE_URL}/login/check")
        if [ "$LOGIN_CODE2" -eq 200 ] && grep -qiE "(logout|dashboard|Sign out)" "$TMP_DIR/dashboard2.html"; then
            echo "SUCCESS: Successfully authenticated as ${USERNAME} with fallback password"
            exit 0
        fi
    fi
    echo "FAILED: Authentication failed for ${USERNAME} (HTTP $LOGIN_CODE)"
    exit 1
fi
