#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18741}"
APP_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${1:-${AUDIOBOOKSHELF_USERNAME:-${AUDIOBOOKSHELF_USER:-${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-root}}}}}}"
PASSWORD="${2:-${AUDIOBOOKSHELF_PASSWORD:-${ADMIN_PASSWORD:-${APP_PASSWORD:-${PASSWORD:-benchmark-only}}}}}"

echo "Testing access and login to Audiobookshelf at ${APP_URL}..."

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
    echo "Error: Audiobookshelf web endpoints not responding as expected (ping=${HTTP_PING}, root=${HTTP_ROOT})."
    exit 1
fi

# 3. Check initialization status and initialize if necessary
STATUS_RESP=$(curl -s "${APP_URL}/status" || true)
if echo "${STATUS_RESP}" | grep -q '"isInit":false'; then
    echo "Notice: Server uninitialized. Initializing root user..."
    INIT_CODE=$(curl -s -o /dev/null -w "%{http_code}" -X POST "${APP_URL}/init" \
        -H "Content-Type: application/json" \
        -d "{\"newRoot\":{\"username\":\"${USERNAME}\",\"password\":\"${PASSWORD}\"}}" || true)
    if [ "${INIT_CODE}" = "200" ]; then
        echo "Root user successfully created."
    else
        echo "Warning: Init attempt returned HTTP ${INIT_CODE}"
    fi
fi

# 4. Test authentication via POST /login
echo "Testing Audiobookshelf authentication for user '${USERNAME}'..."
LOGIN_OUTPUT=$(curl -s -w "\n%{http_code}" -X POST "${APP_URL}/login" \
    -H "Content-Type: application/json" \
    -d "{\"username\":\"${USERNAME}\",\"password\":\"${PASSWORD}\"}" || true)

HTTP_LOGIN=$(echo "${LOGIN_OUTPUT}" | tail -n 1)
LOGIN_RESP=$(echo "${LOGIN_OUTPUT}" | sed '$d')

if [ "${HTTP_LOGIN}" = "200" ] && echo "${LOGIN_RESP}" | grep -qE '("user"|"accessToken"|"token")'; then
    echo "SUCCESS: Audiobookshelf login verification passed completely (HTTP 200)!"
    exit 0
fi

echo "Error: Audiobookshelf login verification failed (HTTP ${HTTP_LOGIN}). Response: ${LOGIN_RESP}"
exit 1
