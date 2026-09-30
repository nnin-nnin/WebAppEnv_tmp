#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18658}"
BASE_URL="http://127.0.0.1:${HOST_PORT}"

echo "Verifying NocoDB service accessibility and authentication readiness at ${BASE_URL}..."

# Check root page
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: NocoDB web interface returned HTTP ${HTTP_CODE}"
    exit 0
fi

# Fallback: check dashboard with redirect follow
DASHBOARD_CODE=$(curl -s -L -o /dev/null -w "%{http_code}" "${BASE_URL}/dashboard/" || true)
if [ "$DASHBOARD_CODE" -eq 200 ]; then
    echo "SUCCESS: NocoDB dashboard returned HTTP ${DASHBOARD_CODE}"
    exit 0
fi

echo "FAILED: NocoDB login verification failed (HTTP ${HTTP_CODE}, dashboard HTTP ${DASHBOARD_CODE})"
exit 1
