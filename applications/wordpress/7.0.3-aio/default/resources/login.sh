#!/usr/bin/env bash
set -euo pipefail

HOST_PORT="${HOST_PORT:-18755}"
BASE_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${WORDPRESS_USER:-${ADMIN_USER:-${USERNAME:-admin}}}"
PASSWORD="${WORDPRESS_PASSWORD:-${ADMIN_PASSWORD:-${PASSWORD:-password}}}"

echo "Validating WordPress login at ${BASE_URL} as ${USERNAME}..."

cookie=$(mktemp)
body=$(mktemp)
trap 'rm -f "$cookie" "$body"' EXIT

# Fetch initial login page and test cookie
curl --max-time 15 -fsS -c "$cookie" "${BASE_URL}/wp-login.php" >/dev/null

# Post login credentials
code=$(curl --max-time 15 -sS -L -o "$body" -w "%{http_code}" -b "$cookie" -c "$cookie" \
  --data-urlencode "log=${USERNAME}" \
  --data-urlencode "pwd=${PASSWORD}" \
  --data-urlencode "wp-submit=Log In" \
  --data-urlencode "redirect_to=${BASE_URL}/wp-admin/" \
  --data-urlencode "testcookie=1" "${BASE_URL}/wp-login.php")

if [ "$code" -eq 200 ] && grep -Eiq 'Dashboard|wp-admin-bar|Welcome to WordPress|Howdy' "$body"; then
  echo "WordPress login successful for user: ${USERNAME} (HTTP ${code})"
  exit 0
else
  echo "WordPress login failed for user: ${USERNAME} (HTTP ${code})" >&2
  exit 1
fi
