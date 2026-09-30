#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18761}"
BASE_URL="${BASE_URL:-http://127.0.0.1:${HOST_PORT}}"
USER="${APP_USER:-${ADMIN_USER:-${ADMIN_USERNAME:-admin}}}"
PASS="${APP_PASSWORD:-${ADMIN_PASSWORD:-${PASSWORD:-123456}}}"

echo "Verifying ThinkCMF Web entrypoint and admin interface at ${BASE_URL}..."

# Check homepage HTTP 200
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)
if [ "$HTTP_CODE" -ne 200 ]; then
    echo "FAILED: ThinkCMF homepage returned HTTP ${HTTP_CODE}, expected 200"
    exit 1
fi
echo "SUCCESS: ThinkCMF homepage is accessible (HTTP 200)"

# Check admin login page availability
ADMIN_CODE=$(curl -s -L -o /dev/null -w "%{http_code}" "${BASE_URL}/index.php?g=admin&m=public&a=login" || true)
if [ "$ADMIN_CODE" -ne 200 ]; then
    echo "FAILED: ThinkCMF admin login page returned HTTP ${ADMIN_CODE}, expected 200"
    exit 1
fi
echo "SUCCESS: ThinkCMF admin login page is accessible (HTTP 200)"

exit 0
