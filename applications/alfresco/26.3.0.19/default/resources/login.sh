#!/usr/bin/env bash
set -eo pipefail

APP_URL="${APP_URL:-http://localhost:18006}"
ADMIN_USER="${ADMIN_USERNAME:-admin}"
ADMIN_PASS="${ADMIN_PASSWORD:-admin}"

echo "[*] Attempting authentication to Alfresco at ${APP_URL}..."

RESPONSE=$(curl -s -w "\n%{http_code}" -X POST \
  "${APP_URL}/alfresco/api/-default-/public/authentication/versions/1/tickets" \
  -H "Content-Type: application/json" \
  -d "{\"userId\":\"${ADMIN_USER}\",\"password\":\"${ADMIN_PASS}\"}")

HTTP_CODE=$(echo "$RESPONSE" | tail -n 1)
BODY=$(echo "$RESPONSE" | sed '$d')

if [ "$HTTP_CODE" -eq 201 ] || [ "$HTTP_CODE" -eq 200 ]; then
  TICKET=$(echo "$BODY" | grep -o '"id":"[^"]*"' | head -n 1 | cut -d'"' -f4 || echo "success")
  echo "[+] Authentication successful for user '${ADMIN_USER}'. Ticket: ${TICKET}"
  exit 0
else
  echo "[-] Authentication failed with HTTP status ${HTTP_CODE}."
  echo "Response: ${BODY}"
  exit 1
fi
