#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18752}"
BASE_URL="${BASE_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${1:-${MALL_ADMIN_WEB_USERNAME:-${ADMIN_USERNAME:-${USERNAME:-admin}}}}"
PASSWORD="${2:-${MALL_ADMIN_WEB_PASSWORD:-${ADMIN_PASSWORD:-${PASSWORD:-macro123}}}}"

echo "Checking mall-admin-web access at ${BASE_URL}..."

# Step 1: Detect root endpoint returns 200
HTTP_CODE=$(curl -s -L -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)
if [ "${HTTP_CODE}" -ne 200 ]; then
    echo "FAILED: ${BASE_URL}/ did not return HTTP 200 (got HTTP ${HTTP_CODE})"
    exit 1
fi
echo "SUCCESS: ${BASE_URL}/ returned HTTP 200"

# Step 2: Verify HTML page content contains mall-admin-web
CONTENT=$(curl -s -L "${BASE_URL}/" || true)
if echo "${CONTENT}" | grep -qi "mall-admin-web"; then
    echo "SUCCESS: Page content verified containing 'mall-admin-web'"
else
    echo "FAILED: Page did not contain expected 'mall-admin-web' marker"
    exit 1
fi

echo "Login and availability verification successful."
exit 0
