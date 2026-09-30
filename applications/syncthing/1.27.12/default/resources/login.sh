#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18677}"
BASE_URL="${BASE_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-${SYNCTHING_USER:-admin}}}}"
PASSWORD="${ADMIN_PASSWORD:-${APP_PASSWORD:-${SYNCTHING_PASSWORD:-Admin123456!}}}"
API_KEY="${API_KEY:-AdminApiKey123456}"

echo "Checking Syncthing root endpoint at ${BASE_URL}/..."
HTTP_CODE=$(curl -s -L -o /dev/null -w "%{http_code}" -u "${USERNAME}:${PASSWORD}" "${BASE_URL}/" || true)

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: Syncthing web UI returned HTTP 200."
else
    echo "FAILED: Syncthing web UI returned HTTP ${HTTP_CODE} (expected 200)."
    exit 1
fi

echo "Verifying Syncthing authentication via ${BASE_URL}/meta.js for user '${USERNAME}'..."
META_CODE=$(curl -s -o /dev/null -w "%{http_code}" -u "${USERNAME}:${PASSWORD}" "${BASE_URL}/meta.js" || true)

if [ "$META_CODE" -eq 200 ]; then
    echo "SUCCESS: Syncthing user '${USERNAME}' authenticated successfully."
else
    echo "FAILED: Syncthing authentication failed with HTTP ${META_CODE} (expected 200)."
    exit 1
fi

echo "Verifying Syncthing REST ping endpoint at ${BASE_URL}/rest/system/ping..."
PING_RESPONSE=$(curl -s -w "\n%{http_code}" -H "X-API-Key: ${API_KEY}" "${BASE_URL}/rest/system/ping" || true)
PING_CODE=$(echo "$PING_RESPONSE" | tail -n 1)
PING_BODY=$(echo "$PING_RESPONSE" | sed '$d')

if [ "$PING_CODE" -eq 200 ] && echo "$PING_BODY" | grep -q "pong"; then
    echo "SUCCESS: Syncthing REST ping endpoint returned HTTP 200."
else
    echo "FAILED: Syncthing REST ping endpoint returned HTTP ${PING_CODE} (expected 200)."
    exit 1
fi

echo "Login check PASSED!"
exit 0
