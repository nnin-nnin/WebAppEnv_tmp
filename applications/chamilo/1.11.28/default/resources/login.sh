#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18752}"
BASE_URL="http://localhost:${HOST_PORT}"

echo "Checking Chamilo web service at ${BASE_URL}..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/")

if [ "$HTTP_CODE" -eq 200 ] || [ "$HTTP_CODE" -eq 302 ]; then
    echo "SUCCESS: Chamilo web service reachable (HTTP $HTTP_CODE)"
    exit 0
else
    echo "FAILED: Chamilo returned HTTP $HTTP_CODE"
    exit 1
fi
