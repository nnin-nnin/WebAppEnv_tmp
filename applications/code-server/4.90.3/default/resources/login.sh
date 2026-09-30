#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18698}"
APP_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${1:-${CODE_SERVER_USERNAME:-${CODE_SERVER_USER:-${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-admin}}}}}}"
PASSWORD="${2:-${CODE_SERVER_PASSWORD:-${ADMIN_PASSWORD:-${APP_PASSWORD:-${PASSWORD:-Admin123456!}}}}}"

echo "Testing access and authentication for code-server at ${APP_URL}..."

# 1. Check login page endpoint returns HTTP 200
LOGIN_URL="${APP_URL}/login"
HTTP_LOGIN=$(curl -s -o /dev/null -w "%{http_code}" "${LOGIN_URL}")
if [ "${HTTP_LOGIN}" != "200" ]; then
    echo "Error: ${LOGIN_URL} returned HTTP status ${HTTP_LOGIN}, expected 200."
    exit 1
fi
echo "code-server login page verified (${LOGIN_URL} returned HTTP 200)."

# 2. Test authentication against /login endpoint with POST
COOKIE_JAR=$(mktemp)
trap 'rm -f "${COOKIE_JAR}"' EXIT

AUTH_RESP=$(curl -s -c "${COOKIE_JAR}" -d "password=${PASSWORD}" -X POST "${LOGIN_URL}" -D - -o /dev/null)
HTTP_AUTH=$(echo "${AUTH_RESP}" | grep -i "^HTTP/" | tail -n 1 | awk '{print $2}')

if [ "${HTTP_AUTH}" != "302" ] && [ "${HTTP_AUTH}" != "200" ]; then
    echo "Error: Failed to authenticate with password at ${LOGIN_URL} (HTTP ${HTTP_AUTH})."
    exit 1
fi

if ! grep -q "code-server-session" "${COOKIE_JAR}" 2>/dev/null; then
    echo "Error: Authentication did not set code-server-session cookie."
    exit 1
fi

echo "SUCCESS: Administrator '${USERNAME}' authenticated successfully via code-server login."
exit 0
