#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18626}"
USERNAME="${WEBMIN_USERNAME:-${WEBMIN_USER:-${ADMIN_USER:-root}}}"
PASSWORD="${WEBMIN_PASSWORD:-${ADMIN_PASSWORD:-password}}"

if [ -n "$APP_URL" ]; then
    BASE_URL="$APP_URL"
elif [ -n "$BASE_URL" ]; then
    BASE_URL="$BASE_URL"
else
    if curl -s -k -o /dev/null -w "%{http_code}" "http://localhost:${HOST_PORT}/session_login.cgi" | grep -q "^200$"; then
        BASE_URL="http://localhost:${HOST_PORT}"
    else
        BASE_URL="https://localhost:${HOST_PORT}"
    fi
fi

echo "Verifying Webmin login endpoint at ${BASE_URL}/session_login.cgi..."

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

# Step 1: Verify HTTP/HTTPS status 200 on port 18626 /session_login.cgi
HTTP_CODE=$(curl -s -k -c "$TMP_DIR/cookies.txt" -b "$TMP_DIR/cookies.txt" -o "$TMP_DIR/login.html" -w "%{http_code}" "${BASE_URL}/session_login.cgi")

if [ "$HTTP_CODE" -ne 200 ]; then
    echo "FAILED: /session_login.cgi returned HTTP ${HTTP_CODE} (expected 200)"
    exit 1
fi

echo "SUCCESS: /session_login.cgi returned HTTP 200"

if ! grep -qiE "(Webmin|session_login)" "$TMP_DIR/login.html"; then
    echo "FAILED: Response does not appear to be Webmin login page"
    exit 1
fi

# Step 2: Authenticate with username and password
echo "Authenticating user '${USERNAME}' via session_login.cgi..."
LOGIN_CODE=$(curl -s -k -L -b "$TMP_DIR/cookies.txt" -c "$TMP_DIR/cookies.txt" -o "$TMP_DIR/auth.html" -w "%{http_code}" \
    -d "user=${USERNAME}&pass=${PASSWORD}" \
    "${BASE_URL}/session_login.cgi")

if [ "$LOGIN_CODE" -eq 200 ] && grep -qiE "(Webmin|sid=|Successful|dashboard|system_info|wbm-webmin)" "$TMP_DIR/auth.html"; then
    echo "SUCCESS: Successfully logged in to Webmin as '${USERNAME}' (HTTP ${LOGIN_CODE})"
    exit 0
else
    echo "FAILED: Authentication failed (HTTP ${LOGIN_CODE})"
    exit 1
fi
