#!/usr/bin/env bash
set -euo pipefail

HOST_PORT="${HOST_PORT:-18762}"
BASE_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${GETSIMPLECMS_USER:-${ADMIN_USER:-${USERNAME:-admin}}}"
PASSWORD="${GETSIMPLECMS_PASSWORD:-${ADMIN_PASSWORD:-${PASSWORD:-admin}}}"

echo "Validating GetSimple CMS login at ${BASE_URL} as ${USERNAME}..."

cookie=$(mktemp)
body=$(mktemp)
trap 'rm -f "$cookie" "$body"' EXIT

# Fetch initial admin login page
curl --max-time 15 -fsS -c "$cookie" "${BASE_URL}/admin/index.php" >/dev/null

# Post login credentials
code=$(curl --max-time 15 -sS -L -o "$body" -w "%{http_code}" -b "$cookie" -c "$cookie" \
  -d "userid=${USERNAME}" \
  -d "pwd=${PASSWORD}" \
  -d "submitted=Login" \
  "${BASE_URL}/admin/index.php")

if [ "$code" -eq 200 ] && grep -Eiq 'Logout|Pages|Edit|pages\.php' "$body"; then
  echo "GetSimple CMS login successful for user: ${USERNAME} (HTTP ${code})"
  exit 0
else
  echo "GetSimple CMS login failed for user: ${USERNAME} (HTTP ${code})" >&2
  exit 1
fi
