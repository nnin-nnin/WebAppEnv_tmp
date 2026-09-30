#!/usr/bin/env bash
set -euo pipefail

APP_URL="${APP_URL:-http://127.0.0.1:18855}"
USERNAME="${1:-${ADMIN_USERNAME:-admin}}"
PASSWORD="${2:-${ADMIN_PASSWORD:-AdminPassword123!}}"
COOKIE_FILE="$(mktemp)"

cleanup() {
    rm -f "${COOKIE_FILE}"
}
trap cleanup EXIT

echo "Attempting login to ${APP_URL} as ${USERNAME}..."

LOGIN_PAGE=$(curl -sS -c "${COOKIE_FILE}" -b "${COOKIE_FILE}" "${APP_URL}/login.php")
LOGIN_TOKEN=$(printf '%s' "${LOGIN_PAGE}" | grep -o 'name="logintoken"[^>]*value="[^"]*"' | sed -E 's/.*value="([^"]+)".*/\1/' | head -n 1)

if [ -z "${LOGIN_TOKEN}" ]; then
    echo "ERROR: Failed to extract login token from login page."
    exit 1
fi

RESPONSE_HEADERS=$(curl -sS -i -c "${COOKIE_FILE}" -b "${COOKIE_FILE}" \
    -X POST "${APP_URL}/login.php" \
    -H "Content-Type: application/x-www-form-urlencoded" \
    --data-urlencode "json=1" \
    --data-urlencode "form_aktion=login" \
    --data-urlencode "logintoken=${LOGIN_TOKEN}" \
    --data-urlencode "form_loginname=${USERNAME}" \
    --data-urlencode "form_password=${PASSWORD}" \
    --data-urlencode "md5pass=")

HTTP_STATUS=$(printf '%s' "${RESPONSE_HEADERS}" | grep -E '^HTTP/[0-9.]+ [0-9]+' | tail -n 1 | awk '{print $2}')
LOCATION=$(printf '%s' "${RESPONSE_HEADERS}" | grep -i '^Location:' | tr -d '\r' | awk '{print $2}' || true)

if [ "${HTTP_STATUS}" = "302" ] && echo "${LOCATION}" | grep -q "phpwcms.php"; then
    echo "Login successful for user '${USERNAME}' (Redirected to ${LOCATION})!"
    DASHBOARD=$(curl -sS -c "${COOKIE_FILE}" -b "${COOKIE_FILE}" -L "${LOCATION}")
    if echo "${DASHBOARD}" | grep -qi "phpwcms"; then
        echo "Backend dashboard verified successfully!"
        exit 0
    else
        echo "Backend dashboard reachable."
        exit 0
    fi
else
    echo "ERROR: Login failed for user '${USERNAME}'. HTTP Status: ${HTTP_STATUS}."
    printf '%s\n' "${RESPONSE_HEADERS}" | head -n 25
    exit 1
fi
