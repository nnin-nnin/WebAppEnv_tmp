#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18845}"
APP_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${1:-${ADMIN_USERNAME:-admin}}"
PASSWORD="${2:-${ADMIN_PASSWORD:-AdminPassword123!}}"
COOKIE_FILE="$(mktemp -t monstra_cookie.XXXXXX)"
trap 'rm -f "${COOKIE_FILE}"' EXIT

if [ -z "${USERNAME}" ] || [ -z "${PASSWORD}" ]; then
    echo "Usage: $0 [username] [password]"
    exit 1
fi

echo "Attempting login to ${APP_URL}/admin/ as ${USERNAME}..."

# Monstra admin login: POST to /admin/index.php
# Form fields: login, password, login_submit
RESPONSE=$(curl -sS -i -c "${COOKIE_FILE}" -b "${COOKIE_FILE}" \
  -X POST "${APP_URL}/admin/index.php" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  --data-urlencode "login=${USERNAME}" \
  --data-urlencode "password=${PASSWORD}" \
  --data-urlencode "login_submit=Log In")

HTTP_CODE=$(echo "${RESPONSE}" | grep -E '^HTTP/[0-9.]+ [0-9]+' | tail -n 1 | awk '{print $2}')

# Follow redirect or check dashboard
DASHBOARD=$(curl -sS -b "${COOKIE_FILE}" "${APP_URL}/admin/index.php")

if echo "${RESPONSE}" | grep -qi "Location: index.php" || echo "${DASHBOARD}" | grep -qi "Administration" || echo "${DASHBOARD}" | grep -qi "Log Out"; then
    echo "Login successful for user '${USERNAME}' (HTTP ${HTTP_CODE})!"
    echo "Admin dashboard verified successfully."
    exit 0
else
    echo "Error: Login failed for user '${USERNAME}' (HTTP ${HTTP_CODE})."
    exit 1
fi
