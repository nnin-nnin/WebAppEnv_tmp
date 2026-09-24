#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18631}"
USERNAME="${ADMIN_USERNAME:-${LETSCHAT_USERNAME:-${ADMIN_USER:-${LETSCHAT_USER:-${USERNAME:-admin}}}}}"
PASSWORD="${ADMIN_PASSWORD:-${LETSCHAT_PASSWORD:-${ADMIN_PASS:-${LETSCHAT_PASS:-${PASSWORD:-AdminPassword123!}}}}}"
EMAIL="${ADMIN_EMAIL:-${LETSCHAT_EMAIL:-admin@benchmark.local}}"
URL="http://127.0.0.1:${HOST_PORT}"

echo "Checking login page at ${URL}/login..."
LOGIN_PAGE_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "${URL}/login" 2>/dev/null || true)
if [ "$LOGIN_PAGE_STATUS" != "200" ]; then
    echo "FAILED: Login page returned HTTP ${LOGIN_PAGE_STATUS}"
    exit 1
fi
echo "SUCCESS: Login page returned HTTP 200"

COOKIE_FILE=$(mktemp)
trap 'rm -f "$COOKIE_FILE"' EXIT

echo "Attempting authentication for user '${USERNAME}'..."
LOGIN_RESP=$(curl -s -c "$COOKIE_FILE" -X POST "${URL}/account/login" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "username=${USERNAME}&password=${PASSWORD}")

if echo "$LOGIN_RESP" | grep -q '"status":"success"'; then
    echo "SUCCESS: Authenticated as ${USERNAME}"
    exit 0
fi

echo "User may not be registered yet. Attempting registration for '${USERNAME}'..."
curl -s -X POST "${URL}/account/register" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "username=${USERNAME}&email=${EMAIL}&display-name=Administrator&first-name=Admin&last-name=User&password=${PASSWORD}&password-confirm=${PASSWORD}" >/dev/null 2>&1 || true

LOGIN_RESP=$(curl -s -c "$COOKIE_FILE" -X POST "${URL}/account/login" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "username=${USERNAME}&password=${PASSWORD}")

if echo "$LOGIN_RESP" | grep -q '"status":"success"'; then
    echo "SUCCESS: Authenticated as ${USERNAME}"
    exit 0
else
    echo "FAILED: Authentication failed for ${USERNAME}"
    echo "$LOGIN_RESP"
    exit 1
fi
