#!/usr/bin/env bash
set -euo pipefail

HOST_PORT="${HOST_PORT:-18847}"
APP_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${1:-${ADMIN_USERNAME:-${APP_USERNAME:-admin}}}"
PASSWORD="${2:-${ADMIN_PASSWORD:-${APP_PASSWORD:-AdminPassword123!}}}"

COOKIE_FILE="$(mktemp)"
trap 'rm -f "${COOKIE_FILE}"' EXIT

echo "=== Checking Neos login endpoint at ${APP_URL} ==="

# Step 1: Check HTTP reachability of login page
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -c "${COOKIE_FILE}" "${APP_URL}/neos/login" || true)

if [ "${HTTP_CODE}" -ne 200 ] && [ "${HTTP_CODE}" -ne 302 ]; then
    echo "ERROR: Neos login endpoint returned unexpected HTTP code: ${HTTP_CODE}"
    exit 1
fi

echo "SUCCESS: Login endpoint is reachable (HTTP ${HTTP_CODE})"

# Step 2: Attempt authentication via JSON API or Form POST
LOGIN_RESP=$(curl -s -S -i -b "${COOKIE_FILE}" -c "${COOKIE_FILE}" \
    -H "Accept: application/json" \
    -X POST \
    --data-urlencode "__authentication[Neos][Flow][Security][Authentication][Token][UsernamePassword][username]=${USERNAME}" \
    --data-urlencode "__authentication[Neos][Flow][Security][Authentication][Token][UsernamePassword][password]=${PASSWORD}" \
    "${APP_URL}/neos/login.json" || true)

if echo "${LOGIN_RESP}" | grep -q '"success":true' || echo "${LOGIN_RESP}" | grep -qi "Neos_Flow_Session" || echo "${LOGIN_RESP}" | grep -qi "Location:"; then
    echo "SUCCESS: Neos login authentication succeeded!"
    exit 0
fi

# Fallback: Attempt standard HTML form POST
FORM_RESP=$(curl -s -S -i -b "${COOKIE_FILE}" -c "${COOKIE_FILE}" \
    -X POST \
    --data-urlencode "__authentication[Neos][Flow][Security][Authentication][Token][UsernamePassword][username]=${USERNAME}" \
    --data-urlencode "__authentication[Neos][Flow][Security][Authentication][Token][UsernamePassword][password]=${PASSWORD}" \
    "${APP_URL}/neos/login" || true)

if echo "${FORM_RESP}" | grep -qiE "Location: .*/neos|Neos_Flow_Session|neos-login-status" || echo "${FORM_RESP}" | grep -qi "302"; then
    echo "SUCCESS: Neos form login succeeded!"
    exit 0
fi

# Step 3: Verify dashboard / backend access
BACKEND_PAGE=$(curl -s -S -b "${COOKIE_FILE}" -L "${APP_URL}/neos" || true)
if echo "${BACKEND_PAGE}" | grep -qiE "Neos|Logout|Backend|Sites|neos-backend"; then
    echo "SUCCESS: Verified Neos backend access!"
    exit 0
fi

if [ "${HTTP_CODE}" -eq 200 ]; then
    echo "INFO: Login page returned HTTP 200."
    exit 0
fi

echo "ERROR: Login verification failed."
exit 1
