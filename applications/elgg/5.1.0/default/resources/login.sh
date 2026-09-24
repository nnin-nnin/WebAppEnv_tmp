#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18560}"
APP_URL="${APP_URL:-http://localhost:${HOST_PORT}}"
USERNAME="${1:-${ADMIN_USERNAME:-${ADMIN_USER:-${ELGG_USERNAME:-${ELGG_USER:-${USER:-admin}}}}}}"
PASSWORD="${2:-${ADMIN_PASSWORD:-${ADMIN_USER_PASSWORD:-${ELGG_PASSWORD:-${PASSWORD:-AdminPassword123!}}}}}"

echo "Testing login to Elgg at ${APP_URL} for user '${USERNAME}'..."

COOKIE_FILE="$(mktemp /tmp/elgg_cookie.XXXXXX)"
trap 'rm -f "${COOKIE_FILE}"' EXIT

LOGIN_PAGE=$(curl -s -L -c "${COOKIE_FILE}" -b "${COOKIE_FILE}" "${APP_URL}/")
if [ -z "${LOGIN_PAGE}" ]; then
    echo "Error: Failed to fetch homepage from ${APP_URL}."
    exit 1
fi

TOKEN=$(echo "${LOGIN_PAGE}" | grep -o 'name="__elgg_token" value="[^"]*"' | head -n 1 | cut -d'"' -f4)
TS=$(echo "${LOGIN_PAGE}" | grep -o 'name="__elgg_ts" value="[^"]*"' | head -n 1 | cut -d'"' -f4)

if [ -z "${TOKEN}" ] || [ -z "${TS}" ]; then
    TOKEN=$(echo "${LOGIN_PAGE}" | grep -o '__elgg_token":"[^"]*"' | head -n 1 | cut -d'"' -f3)
    TS=$(echo "${LOGIN_PAGE}" | grep -o '__elgg_ts":[0-9]*' | head -n 1 | cut -d':' -f2)
fi

if [ -z "${TOKEN}" ] || [ -z "${TS}" ]; then
    echo "Error: CSRF security tokens not found on Elgg page."
    exit 1
fi

LOGIN_RESP=$(curl -s -i -b "${COOKIE_FILE}" -c "${COOKIE_FILE}" \
    -X POST "${APP_URL}/action/login" \
    -H "X-Requested-With: XMLHttpRequest" \
    -F "__elgg_token=${TOKEN}" \
    -F "__elgg_ts=${TS}" \
    -F "username=${USERNAME}" \
    -F "password=${PASSWORD}")

if echo "${LOGIN_RESP}" | grep -qi '"status":0' && echo "${LOGIN_RESP}" | grep -qi 'logged in'; then
    echo "SUCCESS: Login successful for user '${USERNAME}'!"
    exit 0
else
    echo "Error: Login failed for user '${USERNAME}'."
    echo "${LOGIN_RESP}" | head -n 25
    exit 1
fi
