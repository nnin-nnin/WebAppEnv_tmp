#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18851}"
ADMIN_USER="${ADMIN_USER:-admin@example.com}"
ADMIN_PASSWORD="${ADMIN_PASSWORD:-AdminPassword123!}"
ADMIN_URL="http://127.0.0.1:${HOST_PORT}/admin/"

echo "Attempting admin login to OXID eShop at ${ADMIN_URL} with user '${ADMIN_USER}'..."

COOKIE_JAR=$(mktemp)
trap 'rm -f "$COOKIE_JAR"' EXIT

# Step 1: Request admin login page to retrieve CSRF token (stoken) and session ID (admin_sid)
LOGIN_PAGE=$(curl -s -c "$COOKIE_JAR" -b "$COOKIE_JAR" "${ADMIN_URL}")
STOKEN=$(echo "$LOGIN_PAGE" | grep -o 'name="stoken" value="[^"]*"' | head -n 1 | cut -d'"' -f4)
ADMIN_SID=$(echo "$LOGIN_PAGE" | grep -o 'name="admin_sid" value="[^"]*"' | head -n 1 | cut -d'"' -f4)

if [ -z "$STOKEN" ] || [ -z "$ADMIN_SID" ]; then
    echo "ERROR: Failed to retrieve stoken or admin_sid from login page."
    exit 1
fi

echo "Retrieved tokens (stoken: ${STOKEN}, admin_sid: ${ADMIN_SID}). Submitting credentials..."

# Step 2: Submit credentials
RESPONSE=$(curl -s -i -c "$COOKIE_JAR" -b "$COOKIE_JAR" -L \
  -d "stoken=${STOKEN}" \
  -d "admin_sid=${ADMIN_SID}" \
  -d "fnc=checklogin" \
  -d "cl=login" \
  -d "user=${ADMIN_USER}" \
  -d "pwd=${ADMIN_PASSWORD}" \
  "http://127.0.0.1:${HOST_PORT}/admin/index.php")

# Step 3: Validate successful login
if echo "$RESPONSE" | grep -q -i -E "Administrationsbereich|admin_start|oxidadminhistory=admin_start"; then
    echo "SUCCESS: Admin login verified successfully for user '${ADMIN_USER}'!"
    exit 0
else
    echo "FAILED: Admin login validation failed."
    echo "Response preview:"
    echo "$RESPONSE" | head -n 25
    exit 1
fi
