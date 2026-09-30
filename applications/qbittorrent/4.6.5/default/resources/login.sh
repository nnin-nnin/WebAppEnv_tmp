#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18681}"
BASE_URL="${BASE_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USERNAME:-${APP_USER:-admin}}}}"
PASSWORD="${ADMIN_PASSWORD:-${APP_PASSWORD:-adminadmin}}"

echo "Testing qBittorrent login at ${BASE_URL} for user '${USERNAME}'..."

# Step 1: Check WebUI interface accessibility (requirement: http://127.0.0.1:18681/ returns 200)
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)

if [ "$HTTP_CODE" -ne 200 ]; then
    echo "FAILED: qBittorrent Web UI at ${BASE_URL}/ did not return HTTP 200 (got HTTP ${HTTP_CODE})"
    exit 1
fi

echo "SUCCESS: qBittorrent Web UI root returned HTTP ${HTTP_CODE}"

# Step 2: Authenticate via WebUI API
COOKIE_JAR=$(mktemp)
trap 'rm -f "$COOKIE_JAR"' EXIT

LOGIN_RESP=$(curl -s -i -c "$COOKIE_JAR" \
    -H "Referer: ${BASE_URL}/" \
    --data "username=${USERNAME}&password=${PASSWORD}" \
    "${BASE_URL}/api/v2/auth/login" || true)

if ! echo "$LOGIN_RESP" | grep -q "200 OK"; then
    echo "FAILED: Authentication to ${BASE_URL}/api/v2/auth/login failed"
    exit 1
fi

# Step 3: Verify authenticated session
AUTH_CHECK=$(curl -s -b "$COOKIE_JAR" "${BASE_URL}/api/v2/app/webapiVersion" || true)
if [ -z "$AUTH_CHECK" ] || [ "$AUTH_CHECK" = "Fails." ]; then
    echo "FAILED: Authenticated API call failed"
    exit 1
fi

PAGE_CODE=$(curl -s -o /dev/null -w "%{http_code}" -b "$COOKIE_JAR" "${BASE_URL}/" || true)
if [ "$PAGE_CODE" -ne 200 ]; then
    echo "FAILED: Authenticated page request did not return HTTP 200 (got HTTP ${PAGE_CODE})"
    exit 1
fi

echo "SUCCESS: http://127.0.0.1:${HOST_PORT}/ returned 200 and login session is valid (WebAPI v${AUTH_CHECK})"
exit 0
