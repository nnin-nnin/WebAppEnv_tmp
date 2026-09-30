#!/usr/bin/env bash
set -euo pipefail

TARGET_HOST="${SPREE_HOST:-127.0.0.1}"
TARGET_PORT="${SPREE_PORT:-18866}"
BASE_URL="http://${TARGET_HOST}:${TARGET_PORT}"

USERNAME="${SPREE_ADMIN_USER:-admin@example.com}"
PASSWORD="${SPREE_ADMIN_PASS:-AdminPassword123!}"

echo "=== [Spree Login Test] Step 1: Requesting Admin Dashboard ==="
DASHBOARD_HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/dashboard")
if [ "${DASHBOARD_HTTP_CODE}" != "200" ]; then
  echo "[-] ERROR: Admin dashboard GET /dashboard returned HTTP ${DASHBOARD_HTTP_CODE} (expected 200)"
  exit 1
fi
echo "[+] Admin dashboard is accessible (HTTP 200)."

echo "=== [Spree Login Test] Step 2: Authenticating via Admin API (/api/v3/admin/auth/login) ==="
LOGIN_RESPONSE=$(curl -s -w "\n%{http_code}" -X POST "${BASE_URL}/api/v3/admin/auth/login" \
  -H "Content-Type: application/json" \
  -d "{\"email\": \"${USERNAME}\", \"password\": \"${PASSWORD}\"}")

HTTP_CODE=$(echo "${LOGIN_RESPONSE}" | tail -n 1)
RESPONSE_BODY=$(echo "${LOGIN_RESPONSE}" | sed '$d')

echo "[+] Login HTTP response status: ${HTTP_CODE}"

if [ "${HTTP_CODE}" != "200" ]; then
  echo "[-] ERROR: Expected HTTP 200 on successful login, received ${HTTP_CODE}."
  echo "${RESPONSE_BODY}"
  exit 1
fi

TOKEN=$(echo "${RESPONSE_BODY}" | grep -o '"token":"[^"]*"' | sed -E 's/.*"token":"([^"]+)".*/\1/' || true)
if [ -z "${TOKEN}" ]; then
  echo "[-] ERROR: Could not extract JWT token from login response."
  echo "${RESPONSE_BODY}"
  exit 1
fi
echo "[+] Successfully acquired admin JWT token."

echo "=== [Spree Login Test] Step 3: Verifying authenticated access to admin dashboard API ==="
COUNTERS_RESPONSE=$(curl -s -w "\n%{http_code}" -X GET "${BASE_URL}/api/v3/admin/dashboard/counters" \
  -H "Authorization: Bearer ${TOKEN}")

AUTH_HTTP_CODE=$(echo "${COUNTERS_RESPONSE}" | tail -n 1)
AUTH_BODY=$(echo "${COUNTERS_RESPONSE}" | sed '$d')

if [ "${AUTH_HTTP_CODE}" != "200" ]; then
  echo "[-] ERROR: Authenticated request to /api/v3/admin/dashboard/counters returned HTTP ${AUTH_HTTP_CODE} (expected 200)"
  echo "${AUTH_BODY}"
  exit 1
fi

if echo "${AUTH_BODY}" | grep -q "counters"; then
  echo "[+] Authenticated session confirmed: counters returned successfully for '${USERNAME}'."
else
  echo "[-] ERROR: Response body missing expected 'counters' field."
  echo "${AUTH_BODY}"
  exit 1
fi

echo "=== [Spree Login Test] ALL VERIFICATIONS PASSED ==="
exit 0
