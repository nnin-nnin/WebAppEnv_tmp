#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18625}"
BASE_URL="${BASE_URL:-http://localhost:${HOST_PORT}}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-admin}}}"
PASSWORD="${ADMIN_PASSWORD:-${ADMIN_PASS:-${APP_PASSWORD:-benchmark-only}}}"

echo "Testing Zen Cart login endpoints at ${BASE_URL}..."

# Check customer login endpoint
CUSTOMER_LOGIN_URL="${BASE_URL}/index.php?main_page=login"
HTTP_CODE_CUST=$(curl -s -o /dev/null -w "%{http_code}" -H "User-Agent: Mozilla/5.0" "${CUSTOMER_LOGIN_URL}" 2>/dev/null || true)
echo "Customer login endpoint (${CUSTOMER_LOGIN_URL}) returned HTTP ${HTTP_CODE_CUST}"

# Check admin login endpoint (supports both /admin/ and /manage/)
ADMIN_LOGIN_URL="${BASE_URL}/admin/"
HTTP_CODE_ADMIN=$(curl -s -o /dev/null -w "%{http_code}" -L -H "User-Agent: Mozilla/5.0" "${ADMIN_LOGIN_URL}" 2>/dev/null || true)
echo "Admin login endpoint (${ADMIN_LOGIN_URL}) returned HTTP ${HTTP_CODE_ADMIN}"

MANAGE_LOGIN_URL="${BASE_URL}/manage/login.php"
HTTP_CODE_MANAGE=$(curl -s -o /dev/null -w "%{http_code}" -H "User-Agent: Mozilla/5.0" "${MANAGE_LOGIN_URL}" 2>/dev/null || true)
echo "Manage login endpoint (${MANAGE_LOGIN_URL}) returned HTTP ${HTTP_CODE_MANAGE}"

# Validate that at least one primary login endpoint returns HTTP 200
if [ "${HTTP_CODE_CUST}" = "200" ] || [ "${HTTP_CODE_MANAGE}" = "200" ] || [ "${HTTP_CODE_ADMIN}" = "200" ]; then
    echo "SUCCESS: Zen Cart login endpoint verification passed!"
    exit 0
else
    echo "FAILED: Expected HTTP 200 on login endpoint, received cust=${HTTP_CODE_CUST}, manage=${HTTP_CODE_MANAGE}, admin=${HTTP_CODE_ADMIN}"
    exit 1
fi
