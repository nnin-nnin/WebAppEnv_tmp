#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18542}"
APP_URL="${APP_URL:-http://localhost:${HOST_PORT}}"
USERNAME="${1:-${ADMIN_USERNAME:-${ADMIN_USER:-${FORKCMS_USER:-${USER:-admin@fork-cms.com}}}}}"
PASSWORD="${2:-${ADMIN_PASSWORD:-${ADMIN_USER_PASSWORD:-${FORKCMS_PASSWORD:-${PASSWORD:-AdminPassword123!}}}}}"

echo "Testing login to Fork CMS at ${APP_URL} for user '${USERNAME}'..."

COOKIE_FILE="$(mktemp /tmp/forkcms_cookie.XXXXXX)"
trap 'rm -f "${COOKIE_FILE}"' EXIT

LOGIN_URL="${APP_URL}/private/en/authentication"
LOGIN_PAGE=$(curl -s -L -c "${COOKIE_FILE}" -b "${COOKIE_FILE}" "${LOGIN_URL}")

if [ -z "${LOGIN_PAGE}" ]; then
    echo "Error: Failed to fetch login page from ${LOGIN_URL}."
    exit 1
fi

TOKEN=$(echo "${LOGIN_PAGE}" | sed -n 's/.*name="form_token"[^>]*value="\([^"]*\)".*/\1/p' | head -n 1)
if [ -z "${TOKEN}" ]; then
    TOKEN=$(echo "${LOGIN_PAGE}" | grep -o 'name="form_token" value="[^"]*"' | sed 's/name="form_token" value="//;s/"//' | head -n 1)
fi

if [ -z "${TOKEN}" ]; then
    echo "Error: CSRF form_token not found on login page."
    exit 1
fi

POST_RESP=$(curl -s -i -c "${COOKIE_FILE}" -b "${COOKIE_FILE}" \
    -X POST "${LOGIN_URL}" \
    --data-urlencode "form=authenticationIndex" \
    --data-urlencode "form_token=${TOKEN}" \
    --data-urlencode "backend_email=${USERNAME}" \
    --data-urlencode "backend_password=${PASSWORD}")

DASHBOARD_RESP=$(curl -s -L -c "${COOKIE_FILE}" -b "${COOKIE_FILE}" "${APP_URL}/private/en/dashboard")

if echo "${POST_RESP}" | grep -qi "Location:.*dashboard" || echo "${DASHBOARD_RESP}" | grep -qi "Dashboard"; then
    echo "SUCCESS: Login successful for user '${USERNAME}'!"
    exit 0
else
    echo "Error: Login failed for user '${USERNAME}'."
    echo "${POST_RESP}" | head -n 20
    exit 1
fi
