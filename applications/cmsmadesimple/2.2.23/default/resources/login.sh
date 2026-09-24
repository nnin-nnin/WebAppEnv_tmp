#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18553}"
APP_URL="${APP_URL:-http://localhost:${HOST_PORT}}"
USERNAME="${1:-${ADMIN_USERNAME:-${ADMIN_USER:-${CMSMADESIMPLE_USER:-${USER:-admin}}}}}"
PASSWORD="${2:-${ADMIN_PASSWORD:-${ADMIN_USER_PASSWORD:-${CMSMADESIMPLE_PASSWORD:-${PASSWORD:-AdminPassword123!}}}}}"

echo "Testing login to CMS Made Simple at ${APP_URL} for user '${USERNAME}'..."

COOKIE_FILE="$(mktemp /tmp/cmsms_cookie.XXXXXX)"
trap 'rm -f "${COOKIE_FILE}"' EXIT

LOGIN_URL="${APP_URL}/admin/login.php"
LOGIN_PAGE=$(curl -s -L -c "${COOKIE_FILE}" -b "${COOKIE_FILE}" "${LOGIN_URL}")

if [ -z "${LOGIN_PAGE}" ]; then
    echo "Error: Failed to fetch login page from ${LOGIN_URL}."
    exit 1
fi

if ! echo "${LOGIN_PAGE}" | grep -qi "CMS Made Simple"; then
    echo "Error: Login page does not seem to be CMS Made Simple."
    exit 1
fi

POST_RESP=$(curl -s -i -c "${COOKIE_FILE}" -b "${COOKIE_FILE}" \
    -X POST "${LOGIN_URL}" \
    --data-urlencode "username=${USERNAME}" \
    --data-urlencode "password=${PASSWORD}" \
    --data-urlencode "loginsubmit=Submit")

DASHBOARD_RESP=$(curl -s -L -c "${COOKIE_FILE}" -b "${COOKIE_FILE}" "${APP_URL}/admin/")

if echo "${POST_RESP}" | grep -qi "Location:.*admin" || echo "${DASHBOARD_RESP}" | grep -qiE "(oe_container|CMS Made Simple|Dashboard)"; then
    echo "SUCCESS: Login successful for user '${USERNAME}'!"
    exit 0
else
    echo "Error: Login failed for user '${USERNAME}'."
    echo "${POST_RESP}" | head -n 20
    exit 1
fi
