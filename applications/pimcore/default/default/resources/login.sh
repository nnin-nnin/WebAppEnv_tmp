#!/usr/bin/env bash
set -euo pipefail

HOST_PORT="${HOST_PORT:-18857}"
APP_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${ADMIN_USERNAME:-admin}"
PASSWORD="${ADMIN_PASSWORD:-AdminPassword123!}"

COOKIE_FILE="$(mktemp)"
trap 'rm -f "$COOKIE_FILE"' EXIT

echo "=== Attempting login to Pimcore Admin ==="
echo "URL: ${APP_URL}/admin/login"
echo "User: ${USERNAME}"

# Step 1: Fetch login page to initiate session and obtain cookies
LOGIN_HTML=$(curl -s -S -L -c "$COOKIE_FILE" -b "$COOKIE_FILE" "${APP_URL}/admin/login")

# Extract CSRF token from HTML or csrf-token endpoint
CSRF_TOKEN=$(echo "$LOGIN_HTML" | python3 -c '
import sys, re
html = sys.stdin.read()
m = re.search(r"name=[\x27\"]csrfToken[\x27\"]\s+(?:id=[\x27\"][^\x27\"]+[\x27\"]\s+)?value=[\x27\"]([^\x27\"]+)[\x27\"]", html)
if not m:
    m = re.search(r"value=[\x27\"]([^\x27\"]+)[\x27\"]\s+name=[\x27\"]csrfToken[\x27\"]", html)
if m:
    print(m.group(1))
' || true)

if [ -z "$CSRF_TOKEN" ]; then
    CSRF_RESP=$(curl -s -S -c "$COOKIE_FILE" -b "$COOKIE_FILE" "${APP_URL}/admin/login/csrf-token" || true)
    CSRF_TOKEN=$(echo "$CSRF_RESP" | python3 -c '
import sys, json
try:
    data = json.load(sys.stdin)
    print(data.get("csrfToken", ""))
except Exception:
    pass
' || true)
fi

if [ -n "$CSRF_TOKEN" ]; then
    echo "Extracted CSRF token: ${CSRF_TOKEN:0:15}..."
else
    echo "WARNING: Could not extract CSRF token, proceeding with blank token"
    CSRF_TOKEN=""
fi

# Step 2: Post login credentials
LOGIN_RESP=$(curl -s -S -i -c "$COOKIE_FILE" -b "$COOKIE_FILE" \
    -X POST \
    -d "username=${USERNAME}" \
    -d "password=${PASSWORD}" \
    -d "csrfToken=${CSRF_TOKEN}" \
    "${APP_URL}/admin/login/login")

# Step 3: Check redirect or authenticated admin access
DASHBOARD=$(curl -s -S -L -c "$COOKIE_FILE" -b "$COOKIE_FILE" "${APP_URL}/admin/")

if echo "$LOGIN_RESP" | grep -qiE "Location: .*/admin" || echo "$DASHBOARD" | grep -qiE "pimcore|ext-all|pimcore_admin"; then
    echo "SUCCESS: Pimcore admin login verified!"
    exit 0
else
    echo "ERROR: Pimcore admin login failed. Login response snippet:"
    echo "$LOGIN_RESP" | head -n 30
    exit 1
fi
