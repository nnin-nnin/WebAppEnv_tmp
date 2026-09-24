#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18585}"
BASE_URL="http://localhost:${HOST_PORT}"
USER="${APP_USER:-${ADMIN_USER:-${ADMIN_USERNAME:-admin}}}"
PASS="${APP_PASSWORD:-${ADMIN_PASSWORD:-${PASSWORD:-dolphinscheduler123}}}"

echo "Verifying DolphinScheduler Web UI and authentication at ${BASE_URL}..."

# Check Web UI availability
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/dolphinscheduler/ui" || true)
if [ "$HTTP_CODE" -ne 200 ]; then
    echo "FAILED: Web UI returned HTTP ${HTTP_CODE}, expected 200"
    exit 1
fi
echo "SUCCESS: DolphinScheduler Web UI is accessible (HTTP 200)"

# Verify API login
LOGIN_RESP=$(curl -s -X POST "${BASE_URL}/dolphinscheduler/login" -d "userName=${USER}&userPassword=${PASS}")
if echo "$LOGIN_RESP" | grep -qi '"msg":"login success"'; then
    echo "SUCCESS: DolphinScheduler login verified successfully for user '${USER}'"
    exit 0
fi

echo "FAILED: DolphinScheduler login verification failed"
echo "Response: ${LOGIN_RESP}"
exit 1
