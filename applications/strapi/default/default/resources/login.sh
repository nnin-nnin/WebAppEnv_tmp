#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOST_PORT="${HOST_PORT:-18867}"
BASE_URL="${BASE_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-admin@example.com}}}"
PASSWORD="${ADMIN_PASSWORD:-${APP_PASSWORD:-${PASSWORD:-AdminPassword123!}}}"

echo "[Strapi] Testing admin login at ${BASE_URL}..."

# Step 1: Check admin web panel accessibility
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/admin" || true)
if [ "$HTTP_CODE" -ne 200 ]; then
  echo "[Strapi] ERROR: Admin panel at ${BASE_URL}/admin returned HTTP ${HTTP_CODE} (expected 200)"
  exit 1
fi
echo "[Strapi] Admin panel web interface is accessible (HTTP 200)."

# Step 2: Test Admin login API
LOGIN_RESPONSE=$(curl -s -w "\n%{http_code}" -X POST "${BASE_URL}/admin/login" \
  -H "Content-Type: application/json" \
  -d "{\"email\":\"${USERNAME}\",\"password\":\"${PASSWORD}\"}" || true)

HTTP_STATUS=$(echo "$LOGIN_RESPONSE" | tail -n 1)
RESPONSE_BODY=$(echo "$LOGIN_RESPONSE" | sed '$d')

if [ "$HTTP_STATUS" -eq 200 ] && echo "$RESPONSE_BODY" | grep -qi "token"; then
  echo "[Strapi] Admin authentication succeeded (HTTP 200, JWT token received)."
  echo "[Strapi] Login check PASSED."
  exit 0
else
  echo "[Strapi] ERROR: Admin authentication failed with HTTP ${HTTP_STATUS}."
  echo "[Strapi] Response: ${RESPONSE_BODY}"
  exit 1
fi
