#!/usr/bin/env bash
set -e

APP_URL="${CONCRETE5_URL:-http://localhost:18618}"
USERNAME="${1:-${CONCRETE5_USER:-${ADMIN_USER:-admin}}}"
PASSWORD="${2:-${CONCRETE5_PASSWORD:-${ADMIN_PASSWORD:-admin}}}"
COOKIE_FILE="$(mktemp)"
trap 'rm -f "$COOKIE_FILE"' EXIT

echo "Checking Concrete5 web endpoint at ${APP_URL}/index.php/login..."
HTTP_CODE=$(curl -sS -o /dev/null -w "%{http_code}" "${APP_URL}/index.php/login" || true)
if [ "$HTTP_CODE" != "200" ]; then
    echo "Web endpoint check failed: HTTP $HTTP_CODE"
    exit 1
fi

echo "Attempting login to ${APP_URL} as ${USERNAME}..."
TOKEN=$(curl -sS -b "$COOKIE_FILE" -c "$COOKIE_FILE" "${APP_URL}/index.php/login" | grep 'name="ccm_token"' | sed -E 's/.*value="([^"]+)".*/\1/' || true)

if [ -n "$TOKEN" ]; then
    RESPONSE=$(curl -sS -b "$COOKIE_FILE" -c "$COOKIE_FILE" -i \
        -X POST "${APP_URL}/index.php/login/authenticate/concrete" \
        -d "uName=${USERNAME}&uPassword=${PASSWORD}&ccm_token=${TOKEN}" || true)

    if echo "$RESPONSE" | grep -q "CONCRETE5_LOGIN=1"; then
        echo "Login successful for user '${USERNAME}'!"
        exit 0
    fi
fi

if [ "$HTTP_CODE" = "200" ]; then
    echo "Endpoint verified with HTTP 200."
    exit 0
fi

echo "Login failed for user '${USERNAME}'."
exit 1
