#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18663}"
APP_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${1:-${GOTIFY_USERNAME:-${GOTIFY_USER:-${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-admin}}}}}}"
PASSWORD="${2:-${GOTIFY_PASSWORD:-${ADMIN_PASSWORD:-${APP_PASSWORD:-${PASSWORD:-Admin123456!}}}}}"

echo "Testing access and authentication for Gotify at ${APP_URL}..."

# 1. Check version endpoint returns HTTP 200
VERSION_URL="${APP_URL}/version"
HTTP_VERSION=$(curl -s -o /dev/null -w "%{http_code}" "${VERSION_URL}")
if [ "${HTTP_VERSION}" != "200" ]; then
    echo "Error: ${VERSION_URL} returned HTTP status ${HTTP_VERSION}, expected 200."
    exit 1
fi
echo "Gotify version endpoint verified (${VERSION_URL} returned HTTP 200)."

# 2. Check health endpoint returns HTTP 200
HEALTH_URL="${APP_URL}/health"
HTTP_HEALTH=$(curl -s -o /dev/null -w "%{http_code}" "${HEALTH_URL}")
if [ "${HTTP_HEALTH}" = "200" ]; then
    echo "Gotify health endpoint verified (${HEALTH_URL} returned HTTP 200)."
fi

# 3. Test basic authentication against /current/user endpoint
USER_URL="${APP_URL}/current/user"
AUTH_RESP=$(curl -s -w "\n%{http_code}" -u "${USERNAME}:${PASSWORD}" "${USER_URL}")
HTTP_AUTH=$(echo "${AUTH_RESP}" | tail -n 1)
AUTH_BODY=$(echo "${AUTH_RESP}" | sed '$d')

if [ "${HTTP_AUTH}" = "200" ] && echo "${AUTH_BODY}" | grep -q '"name"'; then
    echo "SUCCESS: Administrator '${USERNAME}' authenticated successfully via Gotify API."
    echo "User details: ${AUTH_BODY}"
    exit 0
fi

echo "Error: Failed to authenticate user '${USERNAME}' at ${USER_URL} (HTTP ${HTTP_AUTH}). Response: ${AUTH_BODY}"
exit 1
