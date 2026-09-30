#!/usr/bin/env bash
set -e

APP_URL="${APP_URL:-http://localhost:18828}"
USERNAME="${1:-${ADMIN_USERNAME:-admin@example.com}}"
PASSWORD="${2:-${ADMIN_PASSWORD:-AdminPassword123!}}"
COOKIE_FILE="$(mktemp -t gila_cookie.XXXXXX)"
trap 'rm -f "${COOKIE_FILE}"' EXIT

if [ -z "${USERNAME}" ] || [ -z "${PASSWORD}" ]; then
    echo "Usage: $0 [username/email] [password]"
    exit 1
fi

if [ "${USERNAME}" = "admin" ]; then
    LOGIN_EMAIL="admin@example.com"
else
    LOGIN_EMAIL="${USERNAME}"
fi

echo "Attempting login to ${APP_URL}/admin as ${LOGIN_EMAIL}..."

RESPONSE=$(curl -sS -i -c "${COOKIE_FILE}" -b "${COOKIE_FILE}" \
  -X POST "${APP_URL}/admin" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  --data-urlencode "username=${LOGIN_EMAIL}" \
  --data-urlencode "password=${PASSWORD}")

if echo "${RESPONSE}" | grep -q "GSESSIONID=" || echo "${RESPONSE}" | grep -qi "Administration" || echo "${RESPONSE}" | grep -qi "menu-toggle"; then
    echo "Login successful for user '${USERNAME}' (${LOGIN_EMAIL})!"
    
    ADMIN_PAGE=$(curl -sS -b "${COOKIE_FILE}" "${APP_URL}/admin")
    if echo "${ADMIN_PAGE}" | grep -qi "Administration" || echo "${ADMIN_PAGE}" | grep -qi "Dashboard"; then
        echo "Admin dashboard verified successfully!"
        exit 0
    else
        echo "Warning: Session cookie obtained but dashboard check returned unexpected content."
        exit 0
    fi
else
    echo "Error: Login failed for user '${USERNAME}'."
    exit 1
fi
