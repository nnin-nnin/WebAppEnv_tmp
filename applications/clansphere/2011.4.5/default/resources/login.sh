#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18531}"
BASE_URL="http://${HOST:-localhost}:${HOST_PORT}"

echo "Checking basic web availability at ${BASE_URL}..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}")

if [ "$HTTP_CODE" -ge 200 ] && [ "$HTTP_CODE" -lt 400 ]; then
    echo "SUCCESS: Login endpoint reachable (HTTP $HTTP_CODE)"
    exit 0
else
    echo "FAILED: Expected 2xx/3xx, got HTTP $HTTP_CODE"
    exit 1
fi
