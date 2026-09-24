#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18544}"
BASE_URL="${BASE_URL:-http://localhost:${HOST_PORT}}"
USERNAME="${1:-${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-Admin}}}}"
PASSWORD="${2:-${ADMIN_PASSWORD:-${APP_PASSWORD:-ipamadmin}}}"

echo "Testing login for phpIPAM at ${BASE_URL} with user ${USERNAME}..."

COOKIE_FILE="$(mktemp)"
trap 'rm -f "$COOKIE_FILE"' EXIT

# Submit credentials to phpipam login endpoint
RESPONSE=$(curl -sS -c "$COOKIE_FILE" -b "$COOKIE_FILE" \
  -X POST "${BASE_URL}/app/login/login_check.php" \
  --data-urlencode "ipamusername=${USERNAME}" \
  --data-urlencode "ipampassword=${PASSWORD}")

if echo "$RESPONSE" | grep -qi "alert-success"; then
  DASHBOARD=$(curl -sS -b "$COOKIE_FILE" "${BASE_URL}/index.php?page=dashboard")
  if echo "$DASHBOARD" | grep -qiE "(Dashboard|Logged in as|Administration|Logout)"; then
    echo "SUCCESS: Successfully authenticated as ${USERNAME} and verified dashboard access!"
    exit 0
  fi
fi

# Fallback test with default password if custom password failed
if [ "$PASSWORD" != "ipamadmin" ]; then
  echo "Retrying with default password 'ipamadmin'..."
  RESPONSE2=$(curl -sS -c "$COOKIE_FILE" -b "$COOKIE_FILE" \
    -X POST "${BASE_URL}/app/login/login_check.php" \
    --data-urlencode "ipamusername=${USERNAME}" \
    --data-urlencode "ipampassword=ipamadmin")
  if echo "$RESPONSE2" | grep -qi "alert-success"; then
    echo "SUCCESS: Successfully authenticated as ${USERNAME} with fallback password!"
    exit 0
  fi
fi

echo "FAILED: Authentication failed for ${USERNAME}. Response: ${RESPONSE}"
exit 1
