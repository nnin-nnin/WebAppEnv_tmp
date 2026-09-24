#!/usr/bin/env bash
set -euo pipefail

APP_URL="${APP_URL:-http://127.0.0.1:18009}"
ADMIN_USER="${ADMIN_USERNAME:-admin}"
ADMIN_PASS="${ADMIN_PASSWORD:-benchmark-only}"

NEW_USER="${1:-testuser}"
NEW_EMAIL="${2:-testuser@example.com}"
NEW_PASS="${3:-Password123!}"

if [ -z "$NEW_USER" ] || [ -z "$NEW_EMAIL" ] || [ -z "$NEW_PASS" ]; then
    echo "Usage: $0 <username> <email> <password>"
    exit 1
fi

COOKIE_FILE="$(mktemp)"
trap 'rm -f "$COOKIE_FILE"' EXIT

echo "=== Registering user: ${NEW_USER} via Admin API ==="

# Step 1: Login as Admin
LOGIN_PAGE=$(curl -s -S -c "$COOKIE_FILE" -b "$COOKIE_FILE" "${APP_URL}/index.php/admin/login")
TOKEN=$(echo "$LOGIN_PAGE" | grep -o 'value="[^"]*"' | head -n1 | cut -d'"' -f2 || true)

if [ -z "$TOKEN" ]; then
    echo "ERROR: Could not get login CSRF token."
    exit 1
fi

LOGIN_RESP=$(curl -s -S -i -c "$COOKIE_FILE" -b "$COOKIE_FILE" \
    -X POST \
    -d "token=${TOKEN}" \
    -d "user=${ADMIN_USER}" \
    -d "pass=${ADMIN_PASS}" \
    "${APP_URL}/index.php/admin/login")

# Step 2: Get add-user page CSRF token
ADD_PAGE=$(curl -s -S -c "$COOKIE_FILE" -b "$COOKIE_FILE" "${APP_URL}/index.php/admin/users/add")
ADD_TOKEN=$(echo "$ADD_PAGE" | grep -o 'value="[^"]*"' | head -n1 | cut -d'"' -f2 || true)

if [ -z "$ADD_TOKEN" ]; then
    echo "ERROR: Could not get add-user CSRF token."
    exit 1
fi

# Step 3: Create new user
CREATE_RESP=$(curl -s -S -i -c "$COOKIE_FILE" -b "$COOKIE_FILE" \
    -X POST \
    -d "token=${ADD_TOKEN}" \
    -d "username=${NEW_USER}" \
    -d "email=${NEW_EMAIL}" \
    -d "password=${NEW_PASS}" \
    -d "real_name=${NEW_USER}" \
    -d "bio=Created by register.sh" \
    -d "status=active" \
    "${APP_URL}/index.php/admin/users/add")

if echo "$CREATE_RESP" | grep -iqE "Location: .*/admin/users" || echo "$CREATE_RESP" | grep -iq "users"; then
    echo "SUCCESS: User ${NEW_USER} created successfully!"
    exit 0
else
    USERS_LIST=$(curl -s -S -c "$COOKIE_FILE" -b "$COOKIE_FILE" "${APP_URL}/index.php/admin/users")
    if echo "$USERS_LIST" | grep -iq "$NEW_USER"; then
        echo "SUCCESS: User ${NEW_USER} found in user list!"
        exit 0
    else
        echo "ERROR: Failed to create user. Server response:"
        echo "$CREATE_RESP" | head -n 30
        exit 1
    fi
fi
