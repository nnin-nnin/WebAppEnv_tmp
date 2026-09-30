#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18660}"
BASE_URL="${BASE_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${1:-${ADMIN_USER:-${ADMIN_USERNAME:-admin}}}"
PASSWORD="${2:-${ADMIN_PASSWORD:-Admin123456!}}"

echo "Checking Trilium web endpoint at ${BASE_URL}/..."

# Step 1: Verify root endpoint returns HTTP 200 (following redirects)
HTTP_CODE=$(curl -s -L -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)
if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: ${BASE_URL}/ returned HTTP 200"
else
    echo "FAILED: ${BASE_URL}/ returned HTTP ${HTTP_CODE} (expected 200)"
    exit 1
fi

# Step 2: Check login form authentication
COOKIE_JAR=$(mktemp)
trap 'rm -f "$COOKIE_JAR"' EXIT

LOGIN_RESP=$(curl -s -i -c "$COOKIE_JAR" \
    -d "password=${PASSWORD}" \
    "${BASE_URL}/login" || true)

if echo "$LOGIN_RESP" | grep -qiE "(HTTP/.* (200|302)|Location:)"; then
    echo "SUCCESS: Login request processed successfully"
else
    echo "FAILED: Login request did not succeed"
    exit 1
fi

# Step 3: Verify authenticated session to root endpoint returns HTTP 200
AUTH_CODE=$(curl -s -o /dev/null -w "%{http_code}" -b "$COOKIE_JAR" "${BASE_URL}/" || true)
if [ "$AUTH_CODE" -eq 200 ]; then
    echo "SUCCESS: Authenticated session confirmed with HTTP 200"
else
    echo "FAILED: Authenticated session returned HTTP ${AUTH_CODE}"
    exit 1
fi

echo "Trilium login check PASSED."
exit 0
