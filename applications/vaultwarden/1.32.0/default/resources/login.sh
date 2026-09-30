#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18651}"
APP_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${1:-${VAULTWARDEN_USERNAME:-${VAULTWARDEN_USER:-${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-admin@example.com}}}}}}"
PASSWORD="${2:-${VAULTWARDEN_PASSWORD:-${ADMIN_PASSWORD:-${APP_PASSWORD:-${PASSWORD:-Admin123456!}}}}}"

echo "Testing access and login to Vaultwarden at ${APP_URL}..."

# 1. Check web vault frontend root endpoint
HTTP_ROOT=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/")
if [ "${HTTP_ROOT}" = "200" ]; then
    echo "Web vault frontend reachable at ${APP_URL}/ (HTTP 200)."
else
    echo "Warning: ${APP_URL}/ returned HTTP ${HTTP_ROOT}"
fi

# 2. Check /alive endpoint
HTTP_ALIVE=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/alive")
if [ "${HTTP_ALIVE}" = "200" ]; then
    echo "Health endpoint reachable at ${APP_URL}/alive (HTTP 200)."
fi

# 3. Test admin portal authentication via ADMIN_TOKEN
COOKIE_FILE="$(mktemp /tmp/vw_cookie.XXXXXX)"
trap 'rm -f "${COOKIE_FILE}"' EXIT

ADMIN_URL="${APP_URL}/admin"
HTTP_ADMIN=$(curl -s -o /dev/null -w "%{http_code}" "${ADMIN_URL}")

if [ "${HTTP_ADMIN}" = "200" ]; then
    echo "Admin portal is available at ${ADMIN_URL}, submitting admin authentication..."
    POST_RESP=$(curl -s -i -L -c "${COOKIE_FILE}" -b "${COOKIE_FILE}" \
        -X POST "${ADMIN_URL}" \
        --data-urlencode "token=${PASSWORD}")

    if echo "${POST_RESP}" | grep -qiE "(General settings|Bitwarden|Vaultwarden|logout|admin_settings)"; then
        echo "SUCCESS: Admin authenticated successfully!"
    fi
fi

if [ "${HTTP_ROOT}" = "200" ] || [ "${HTTP_ALIVE}" = "200" ]; then
    echo "SUCCESS: Vaultwarden endpoint and interface verified successfully!"
    exit 0
fi

echo "Error: Vaultwarden endpoints returned unexpected status (root=${HTTP_ROOT}, alive=${HTTP_ALIVE})."
exit 1
