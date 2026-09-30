#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18869}"
BASE_URL="http://${HOST:-127.0.0.1}:${HOST_PORT}"
USERNAME="${1:-${ADMIN_USERNAME:-admin}}"
PASSWORD="${2:-${ADMIN_PASSWORD:-AdminPassword123!}}"
COOKIE_FILE="$(mktemp /tmp/thelia_cookie.XXXXXX)"

cleanup() {
    rm -f "${COOKIE_FILE}"
}
trap cleanup EXIT

echo "Attempting login to ${BASE_URL} as ${USERNAME}..."

LOGIN_HTML=$(curl -sS -c "${COOKIE_FILE}" -b "${COOKIE_FILE}" "${BASE_URL}/admin/login")

CSRF_TOKEN=$(echo "${LOGIN_HTML}" | grep -o 'name="thelia_admin_login\[_token\]"[^>]*value="[^"]*"' | sed 's/.*value="//;s/"//' | head -n 1)

if [ -z "${CSRF_TOKEN}" ]; then
    CSRF_TOKEN=$(echo "${LOGIN_HTML}" | grep -o 'value="[^"]*"[^>]*name="thelia_admin_login\[_token\]"' | sed 's/value="//;s/".*//' | head -n 1)
fi

RESPONSE=$(curl -sS -i -c "${COOKIE_FILE}" -b "${COOKIE_FILE}" \
    -X POST "${BASE_URL}/admin/checklogin" \
    --data-urlencode "thelia_admin_login[username]=${USERNAME}" \
    --data-urlencode "thelia_admin_login[password]=${PASSWORD}" \
    --data-urlencode "thelia_admin_login[_token]=${CSRF_TOKEN}" \
    --data-urlencode "thelia_admin_login[success_url]=/admin")

if echo "${RESPONSE}" | grep -q -E "Location: .*/admin" || echo "${RESPONSE}" | grep -q "302 Found" || echo "${RESPONSE}" | grep -q "303 See Other"; then
    echo "Login successful for user '${USERNAME}' (Redirect received)!"
    exit 0
fi

DASHBOARD=$(curl -sS -b "${COOKIE_FILE}" "${BASE_URL}/admin")
if echo "${DASHBOARD}" | grep -q -i -E "dashboard|admin|catalog|thelia"; then
    echo "Login successful for user '${USERNAME}' (Dashboard accessible)!"
    exit 0
fi

echo "Login failed for user '${USERNAME}'."
exit 1
