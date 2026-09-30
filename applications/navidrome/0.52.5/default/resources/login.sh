#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18678}"
APP_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${1:-${NAVIDROME_USERNAME:-${NAVIDROME_USER:-${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-admin}}}}}}"
PASSWORD="${2:-${NAVIDROME_PASSWORD:-${ADMIN_PASSWORD:-${APP_PASSWORD:-${PASSWORD:-Admin123456!}}}}}"

echo "Testing access and login to Navidrome at ${APP_URL}..."

# 1. Check health / ping endpoint
HTTP_PING=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/ping" || true)
if [ "${HTTP_PING}" = "200" ]; then
    echo "Health endpoint reachable at ${APP_URL}/ping (HTTP 200)."
else
    echo "Notice: ${APP_URL}/ping returned HTTP ${HTTP_PING}"
fi

# 2. Check root / Web UI endpoint
HTTP_ROOT=$(curl -s -L -o /dev/null -w "%{http_code}" "${APP_URL}/" || true)
if [ "${HTTP_ROOT}" = "200" ]; then
    echo "Web UI reachable at ${APP_URL}/ (HTTP 200)."
else
    echo "Notice: ${APP_URL}/ returned HTTP ${HTTP_ROOT}"
fi

# Ensure at least one web endpoint is responding with 200
if [ "${HTTP_PING}" != "200" ] && [ "${HTTP_ROOT}" != "200" ]; then
    echo "Error: Navidrome web endpoints not responding as expected (ping=${HTTP_PING}, root=${HTTP_ROOT})."
    exit 1
fi

# 3. Test Web UI authentication via /auth/login
echo "Testing Navidrome Web UI authentication for user '${USERNAME}'..."
LOGIN_RESP=$(curl -s -X POST "${APP_URL}/auth/login" \
    -H "Content-Type: application/json" \
    -d "{\"username\":\"${USERNAME}\",\"password\":\"${PASSWORD}\"}" || true)

if echo "${LOGIN_RESP}" | grep -q '"token"'; then
    echo "SUCCESS: Navidrome Web UI authenticated successfully!"
else
    echo "Warning: Web UI login did not return a session token. Response: ${LOGIN_RESP}"
fi

# 4. Test Subsonic API authentication via /rest/ping.view
echo "Testing Subsonic API authentication for user '${USERNAME}'..."
SUBSONIC_RESP=$(curl -s "${APP_URL}/rest/ping.view?u=${USERNAME}&p=${PASSWORD}&v=1.16.1&c=healthcheck&f=json" || true)

if echo "${SUBSONIC_RESP}" | grep -q '"status":"ok"'; then
    echo "SUCCESS: Subsonic API ping authenticated successfully!"
else
    echo "Warning: Subsonic ping verification returned: ${SUBSONIC_RESP}"
fi

if echo "${LOGIN_RESP}" | grep -q '"token"' || echo "${SUBSONIC_RESP}" | grep -q '"status":"ok"'; then
    echo "SUCCESS: Navidrome login verification passed completely!"
    exit 0
fi

echo "Error: Both Web UI and Subsonic API authentication failed."
exit 1
