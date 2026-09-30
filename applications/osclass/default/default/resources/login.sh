#!/usr/bin/env bash
set -euo pipefail

APP_URL="${APP_URL:-http://127.0.0.1:18850}"
USERNAME="${ADMIN_USERNAME:-admin}"
PASSWORD="${ADMIN_PASSWORD:-AdminPassword123!}"

COOKIE_FILE="$(mktemp)"
trap 'rm -f "$COOKIE_FILE"' EXIT

echo "=== Attempting login to Osclass Admin ==="
echo "URL: ${APP_URL}/oc-admin/index.php"
echo "User: ${USERNAME}"

# Step 1: Fetch login page to obtain session cookie and CSRF tokens
LOGIN_PAGE=$(curl -s -S -L -c "$COOKIE_FILE" -b "$COOKIE_FILE" "${APP_URL}/oc-admin/index.php?page=login")

CSRF_NAME=$(echo "$LOGIN_PAGE" | python3 -c '
import sys, re
html = sys.stdin.read()
m = re.search(r"name=[\x27\"]CSRFName[\x27\"]\s+value=[\x27\"]([^\x27\"]+)[\x27\"]", html)
if m: print(m.group(1))
' || true)

CSRF_TOKEN=$(echo "$LOGIN_PAGE" | python3 -c '
import sys, re
html = sys.stdin.read()
m = re.search(r"name=[\x27\"]CSRFToken[\x27\"]\s+value=[\x27\"]([^\x27\"]+)[\x27\"]", html)
if m: print(m.group(1))
' || true)

if [ -n "$CSRF_NAME" ] && [ -n "$CSRF_TOKEN" ]; then
    echo "Extracted CSRF token (${CSRF_NAME}): ${CSRF_TOKEN:0:15}..."
else
    echo "ERROR: Failed to extract CSRF tokens from login page."
    exit 1
fi

# Step 2: Post login credentials
LOGIN_RESP=$(curl -s -S -i -c "$COOKIE_FILE" -b "$COOKIE_FILE" \
    -X POST \
    -d "page=login" \
    -d "action=login_post" \
    -d "CSRFName=${CSRF_NAME}" \
    -d "CSRFToken=${CSRF_TOKEN}" \
    -d "user=${USERNAME}" \
    -d "password=${PASSWORD}" \
    -d "submit=Log+in" \
    "${APP_URL}/oc-admin/index.php")

# Step 3: Fetch dashboard to verify active session
DASHBOARD=$(curl -s -S -L -c "$COOKIE_FILE" -b "$COOKIE_FILE" "${APP_URL}/oc-admin/index.php")

if echo "$DASHBOARD" | grep -qiE "Dashboard &raquo; Osclass|action=logout|osc_toolbar_logout"; then
    echo "SUCCESS: Osclass admin login verified via dashboard access!"
    exit 0
else
    echo "ERROR: Login failed. Response snippet:"
    echo "$LOGIN_RESP" | head -n 30
    exit 1
fi
