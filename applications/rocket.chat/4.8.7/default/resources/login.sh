#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18647}"
USERNAME="${ADMIN_USERNAME:-${ROCKET_CHAT_USERNAME:-${ADMIN_USER:-${USERNAME:-admin}}}}"
PASSWORD="${ADMIN_PASSWORD:-${ROCKET_CHAT_PASSWORD:-${ADMIN_PASS:-${PASSWORD:-Admin123456!}}}}"
URL="http://127.0.0.1:${HOST_PORT}"

echo "Checking root endpoint at ${URL}/..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${URL}/" 2>/dev/null || true)
if [ "$HTTP_CODE" != "200" ]; then
    echo "FAILED: Root endpoint returned HTTP ${HTTP_CODE}, expected 200"
    exit 1
fi
echo "SUCCESS: Root endpoint returned HTTP 200"

echo "Attempting authentication for user '${USERNAME}' via REST API..."
LOGIN_RESP=$(curl -s -X POST "${URL}/api/v1/login" \
  -H "Content-Type: application/json" \
  -d "{\"user\": \"${USERNAME}\", \"password\": \"${PASSWORD}\"}")

if echo "$LOGIN_RESP" | grep -q '"status":"success"'; then
    echo "SUCCESS: Authenticated as ${USERNAME}"
    exit 0
else
    echo "FAILED: Authentication failed for ${USERNAME}"
    echo "$LOGIN_RESP"
    exit 1
fi
