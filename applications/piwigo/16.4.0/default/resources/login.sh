#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18567}"
BASE_URL="${BASE_URL:-http://localhost:${HOST_PORT}}"
USERNAME="${1:-${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-admin}}}}"
PASSWORD="${2:-${ADMIN_PASSWORD:-${APP_PASSWORD:-admin}}}"

echo "Testing login for Piwigo at ${BASE_URL} with user ${USERNAME}..."

COOKIE_FILE="$(mktemp)"
trap 'rm -f "$COOKIE_FILE"' EXIT

# Step 1: Initial request to get session cookie (pwg_id)
INIT_HEADERS=$(curl -sS -i "${BASE_URL}/identification.php")
COOKIE_VAL=$(echo "$INIT_HEADERS" | grep -i "Set-Cookie" | grep "pwg_id" | head -n 1 | sed -E 's/.*(pwg_id=[^;]+).*/\1/')

if [ -z "$COOKIE_VAL" ]; then
  curl -sS -c "$COOKIE_FILE" "${BASE_URL}/identification.php" > /dev/null
else
  echo "#HttpOnly_localhost	FALSE	/	FALSE	0	pwg_id	${COOKIE_VAL#pwg_id=}" > "$COOKIE_FILE"
fi

# Step 2: POST credentials to identification.php
LOGIN_RESP=$(curl -sS -i -b "$COOKIE_FILE" -c "$COOKIE_FILE" \
  ${COOKIE_VAL:+-H "Cookie: $COOKIE_VAL"} \
  -X POST "${BASE_URL}/identification.php" \
  --data-urlencode "username=${USERNAME}" \
  --data-urlencode "password=${PASSWORD}" \
  --data-urlencode "login=login")

NEW_COOKIE=$(echo "$LOGIN_RESP" | grep -i "Set-Cookie" | grep "pwg_id" | head -n 1 | sed -E 's/.*(pwg_id=[^;]+).*/\1/')
if [ -n "$NEW_COOKIE" ]; then
  COOKIE_VAL="$NEW_COOKIE"
  echo "#HttpOnly_localhost	FALSE	/	FALSE	0	pwg_id	${COOKIE_VAL#pwg_id=}" > "$COOKIE_FILE"
fi

# Step 3: Verify authenticated access to admin.php
ADMIN_RESP=$(curl -sS -b "$COOKIE_FILE" ${COOKIE_VAL:+-H "Cookie: $COOKIE_VAL"} "${BASE_URL}/admin.php")

if echo "$ADMIN_RESP" | grep -qiE "(Administration|Piwigo Administration|logout)"; then
  echo "SUCCESS: Successfully authenticated as ${USERNAME} and verified admin access!"
  exit 0
fi

echo "FAILED: Authentication failed for ${USERNAME}."
exit 1
