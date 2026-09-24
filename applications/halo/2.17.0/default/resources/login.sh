#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18582}"
BASE_URL="${BASE_URL:-http://localhost:${HOST_PORT}}"

echo "Checking Halo console access at ${BASE_URL}/console..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/console" || true)

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: Halo console accessible (HTTP $HTTP_CODE)"
    exit 0
fi

# Fallback: check /login
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/login" || true)
if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: Halo login accessible (HTTP $HTTP_CODE)"
    exit 0
fi

echo "FAILED: Halo console/login check returned HTTP $HTTP_CODE"
exit 1
