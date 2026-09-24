#!/usr/bin/env bash
set -e

APP_URL="${APP_URL:-http://localhost:18003}"
USERNAME="${1:-${ADMIN_USERNAME:-admin}}"
PASSWORD="${2:-${ADMIN_PASSWORD:-benchmark-only}}"
COOKIE_FILE="${TMPDIR:-/tmp}/admidio_cookie.$$"

if [ -z "${USERNAME}" ] || [ -z "${PASSWORD}" ]; then
    echo "Usage: $0 [username] [password]"
    exit 1
fi

echo "Attempting login to ${APP_URL} as ${USERNAME}..."

LOGIN_PAGE=$(curl -sS -c "${COOKIE_FILE}" -b "${COOKIE_FILE}" \
  "${APP_URL}/system/login.php")
CSRF_TOKEN=$(printf '%s' "${LOGIN_PAGE}" | sed -n 's/.*name="adm_csrf_token"[^>]*value="\([^"]*\)".*/\1/p' | head -1)

if [ -z "${CSRF_TOKEN}" ]; then
    echo "Login failed for user '${USERNAME}': CSRF token not found."
    exit 1
fi

RESPONSE=$(curl -sS -c "${COOKIE_FILE}" -b "${COOKIE_FILE}" \
  -X POST "${APP_URL}/system/login.php?mode=check" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  --data-urlencode "adm_csrf_token=${CSRF_TOKEN}" \
  -d "usr_login_name=${USERNAME}&usr_password=${PASSWORD}")

if echo "${RESPONSE}" | grep -q '"status":"success"'; then
    echo "Login successful for user '${USERNAME}'!"
    exit 0
else
    echo "Login failed for user '${USERNAME}'. Response: ${RESPONSE}"
    exit 1
fi
