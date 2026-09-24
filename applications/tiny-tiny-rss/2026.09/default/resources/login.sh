#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18593}"
BASE_URL="${BASE_URL:-http://localhost:${HOST_PORT}}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-${USER:-admin}}}}"
PASSWORD="${ADMIN_PASSWORD:-${APP_PASSWORD:-${PASSWORD:-password}}}"

echo "Testing Tiny Tiny RSS login at ${BASE_URL} for user '${USERNAME}'..."

COOKIE_JAR=$(mktemp)
trap 'rm -f "$COOKIE_JAR"' EXIT

# Step 1: Check web accessibility
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)
if [ "$HTTP_CODE" -ne 200 ]; then
    echo "FAILED: Web interface not responding with HTTP 200 (got HTTP ${HTTP_CODE})"
    exit 1
fi

# Step 2: Perform login POST request
LOGIN_RESP=$(curl -s -i -b "$COOKIE_JAR" -c "$COOKIE_JAR" \
    -d "op=login" \
    --data-urlencode "login=${USERNAME}" \
    --data-urlencode "password=${PASSWORD}" \
    "${BASE_URL}/public.php?op=login")

HTTP_STATUS=$(echo "$LOGIN_RESP" | grep -i "^HTTP/" | head -n 1 | awk '{print $2}')

# Step 3: Validate authenticated session
AUTH_PAGE=$(curl -s -b "$COOKIE_JAR" "${BASE_URL}/")

if echo "$AUTH_PAGE" | grep -qi "__csrf_token" || echo "$AUTH_PAGE" | grep -qi "<title>Tiny Tiny RSS</title>"; then
    echo "SUCCESS: Tiny Tiny RSS login succeeded for user '${USERNAME}' (HTTP ${HTTP_STATUS})"
    exit 0
fi

echo "FAILED: Tiny Tiny RSS authentication failed"
echo "Login HTTP status: ${HTTP_STATUS}"
echo "Auth page preview:"
echo "$AUTH_PAGE" | head -n 20
exit 1
