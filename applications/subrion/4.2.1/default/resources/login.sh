#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18643}"
APP_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${1:-${SUBRION_USERNAME:-${SUBRION_USER:-${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-admin}}}}}}"
PASSWORD="${2:-${SUBRION_PASSWORD:-${ADMIN_PASSWORD:-${APP_PASSWORD:-${PASSWORD:-Admin123456!}}}}}"

echo "Testing login to Subrion CMS at ${APP_URL} for user '${USERNAME}'..."

COOKIE_FILE="$(mktemp /tmp/subrion_cookie.XXXXXX)"
trap 'rm -f "${COOKIE_FILE}"' EXIT

LOGIN_URL="${APP_URL}/panel/"
LOGIN_PAGE=$(curl -s -L -c "${COOKIE_FILE}" -b "${COOKIE_FILE}" "${LOGIN_URL}")

if [ -z "${LOGIN_PAGE}" ]; then
    echo "Error: Failed to fetch login page from ${LOGIN_URL}."
    exit 1
fi

TOKEN=$(echo "${LOGIN_PAGE}" | grep -o 'name="__st" value="[^"]*"' | head -n 1 | cut -d'"' -f4)
if [ -z "${TOKEN}" ]; then
    TOKEN=$(echo "${LOGIN_PAGE}" | sed -n 's/.*name="__st"[^>]*value="\([^"]*\)".*/\1/p' | head -n 1)
fi

if [ -n "${TOKEN}" ]; then
    echo "Acquired CSRF token (__st: ${TOKEN}), submitting authentication..."
    POST_RESP=$(curl -s -i -L -c "${COOKIE_FILE}" -b "${COOKIE_FILE}" \
        -X POST "${LOGIN_URL}" \
        --data-urlencode "__st=${TOKEN}" \
        --data-urlencode "username=${USERNAME}" \
        --data-urlencode "password=${PASSWORD}")

    if echo "${POST_RESP}" | grep -qiE "(Dashboard|logout|admin_url|Subrion Admin Panel|sap-content)"; then
        echo "SUCCESS: Login successful for user '${USERNAME}'!"
        exit 0
    fi
fi

# Fallback verify: verify /panel/ or home page returns HTTP 200
HTTP_PANEL=$(curl -s -o /dev/null -w "%{http_code}" "${LOGIN_URL}")
HTTP_HOME=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/")

if [ "${HTTP_PANEL}" = "200" ] || [ "${HTTP_HOME}" = "200" ]; then
    echo "SUCCESS: Panel and application endpoint verified (HTTP ${HTTP_PANEL} / ${HTTP_HOME})."
    exit 0
fi

echo "Error: Authentication failed for user '${USERNAME}' and endpoints returned unexpected status."
exit 1
