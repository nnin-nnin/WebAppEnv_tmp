#!/usr/bin/env bash
set -eo pipefail

HOST_PORT="${HOST_PORT:-18802}"
BASE_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${ADMIN_USERNAME:-admin}"
PASSWORD="${ADMIN_PASSWORD:-AdminPassword123!}"

echo "[*] Testing Apache Kylin login for user '${USERNAME}' at ${BASE_URL}/kylin/api/user/authentication..."

RESPONSE=$(curl --noproxy "*" -s -w "\n%{http_code}" -X POST -u "${USERNAME}:${PASSWORD}" "${BASE_URL}/kylin/api/user/authentication" || true)

HTTP_CODE=$(echo "$RESPONSE" | tail -n 1)
BODY=$(echo "$RESPONSE" | sed '$d')

if [ "$HTTP_CODE" -eq 200 ] && echo "$BODY" | grep -q "userDetails"; then
    echo "[+] SUCCESS: Login verified successfully for ${USERNAME} (HTTP $HTTP_CODE)!"
    exit 0
else
    echo "[-] FAILED: Login failed for ${USERNAME} with HTTP $HTTP_CODE"
    echo "$BODY"
    exit 1
fi
