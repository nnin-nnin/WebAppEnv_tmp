#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18581}"
BASE_URL="http://localhost:${HOST_PORT}"

echo "Checking Jenkins login endpoint at ${BASE_URL}/login..."

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/login")
if [ "$HTTP_CODE" -ne 200 ]; then
    echo "FAILED: Jenkins login endpoint returned HTTP ${HTTP_CODE}"
    exit 1
fi

echo "SUCCESS: Jenkins login endpoint verified successfully (HTTP ${HTTP_CODE})"
exit 0
