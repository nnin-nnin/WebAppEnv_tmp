#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18565}"
USERNAME="${ADMIN_USERNAME:-${NODEBB_USERNAME:-${ADMIN_USER:-${NODEBB_USER:-${USERNAME:-admin}}}}}"
PASSWORD="${ADMIN_PASSWORD:-${NODEBB_PASSWORD:-${ADMIN_PASS:-${NODEBB_PASS:-${PASSWORD:-AdminPassword123!}}}}}"
URL="http://127.0.0.1:${HOST_PORT}"

COOKIE_FILE=$(mktemp)
trap 'rm -f "$COOKIE_FILE"' EXIT

echo "Testing login to NodeBB at ${URL} as ${USERNAME}..."

CSRF_TOKEN=$(curl -s -c "$COOKIE_FILE" "${URL}/api/config" | grep -o '"csrf_token":"[^"]*"' | cut -d'"' -f4)
if [ -z "$CSRF_TOKEN" ]; then
    echo "FAILED: Could not retrieve CSRF token from ${URL}/api/config"
    exit 1
fi

LOGIN_RESP=$(curl -s -b "$COOKIE_FILE" -c "$COOKIE_FILE" \
    -H "x-csrf-token: ${CSRF_TOKEN}" \
    -H "Content-Type: application/x-www-form-urlencoded" \
    -d "username=${USERNAME}&password=${PASSWORD}" \
    "${URL}/login")

if echo "$LOGIN_RESP" | grep -q '"next"'; then
    echo "SUCCESS: Authenticated as ${USERNAME}"
    exit 0
else
    echo "FAILED: Authentication failed for ${USERNAME}"
    echo "$LOGIN_RESP"
    exit 1
fi
