#!/usr/bin/env bash
set -eo pipefail

APP_URL="${APP_URL:-http://localhost:18006}"
ADMIN_USER="${ADMIN_USERNAME:-admin}"
ADMIN_PASS="${ADMIN_PASSWORD:-admin}"

NEW_USER="${1:-testuser}"
NEW_PASS="${2:-TestPass123!}"
NEW_EMAIL="${3:-testuser@example.com}"

if [ -z "$NEW_USER" ] || [ -z "$NEW_PASS" ]; then
  echo "Usage: $0 <username> <password> [email]"
  exit 1
fi

echo "[*] Creating user '${NEW_USER}' in Alfresco..."

RESPONSE=$(curl -s -w "\n%{http_code}" -u "${ADMIN_USER}:${ADMIN_PASS}" \
  -X POST "${APP_URL}/alfresco/api/-default-/public/alfresco/versions/1/people" \
  -H "Content-Type: application/json" \
  -d "{\"id\":\"${NEW_USER}\",\"firstName\":\"${NEW_USER}\",\"lastName\":\"User\",\"email\":\"${NEW_EMAIL}\",\"password\":\"${NEW_PASS}\"}")

HTTP_CODE=$(echo "$RESPONSE" | tail -n 1)
BODY=$(echo "$RESPONSE" | sed '$d')

if [ "$HTTP_CODE" -eq 201 ] || [ "$HTTP_CODE" -eq 200 ]; then
  echo "[+] User '${NEW_USER}' successfully registered."
  exit 0
else
  echo "[-] User registration failed with HTTP status ${HTTP_CODE}."
  echo "Response: ${BODY}"
  exit 1
fi
