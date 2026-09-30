#!/usr/bin/env bash
set -euo pipefail

APP_URL="${APP_URL:-http://127.0.0.1:18863}"
USERNAME="${1:-${ADMIN_USERNAME:-admin}}"
PASSWORD="${2:-${ADMIN_PASSWORD:-AdminPassword123!}}"
COOKIE_FILE="$(mktemp)"

cleanup() {
    rm -f "${COOKIE_FILE}"
}
trap cleanup EXIT

echo "Attempting login to ${APP_URL} as ${USERNAME}..."

# Retrieve initial cookies and verify login page reachable
LOGIN_PAGE=$(curl -sS -c "${COOKIE_FILE}" -b "${COOKIE_FILE}" "${APP_URL}/login.php")

if ! printf '%s\n' "${LOGIN_PAGE}" | grep -i "login" >/dev/null 2>&1; then
    echo "ERROR: Login page unreachable or invalid response."
    exit 1
fi

# Submit credentials
RESPONSE_HEADERS=$(curl -sS -i -c "${COOKIE_FILE}" -b "${COOKIE_FILE}" \
    -X POST "${APP_URL}/login.php" \
    -H "Content-Type: application/x-www-form-urlencoded" \
    --data-urlencode "username=${USERNAME}" \
    --data-urlencode "password=${PASSWORD}" \
    --data-urlencode "Submit=Log In")

HTTP_STATUS=$(printf '%s\n' "${RESPONSE_HEADERS}" | grep -E '^HTTP/[0-9.]+ [0-9]+' | head -n 1 | awk '{print $2}')
LOCATION=$(printf '%s\n' "${RESPONSE_HEADERS}" | grep -i '^Location:' | tr -d '\r' | awk '{print $2}' || true)

# ResourceSpace redirects upon successful login
if [ "${HTTP_STATUS}" = "302" ] || [ "${HTTP_STATUS}" = "200" ]; then
    DASHBOARD=$(curl -sS -c "${COOKIE_FILE}" -b "${COOKIE_FILE}" -L "${APP_URL}/index.php")
    if printf '%s\n' "${DASHBOARD}" | grep -iE "ResourceSpace|Search|Collections|logout" >/dev/null 2>&1; then
        echo "Login successful for user '${USERNAME}'! Dashboard verified."
        exit 0
    fi
fi

# If login failed
echo "ERROR: Login failed for user '${USERNAME}'."
printf '%s\n' "${RESPONSE_HEADERS}" | head -n 25
exit 1
