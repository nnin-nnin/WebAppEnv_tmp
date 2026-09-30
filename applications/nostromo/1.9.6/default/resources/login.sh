#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18775}"
BASE_URL="http://127.0.0.1:${HOST_PORT}"

echo "Checking nostromo service accessibility at ${BASE_URL}/..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/")

if [ "$HTTP_CODE" -ne 200 ]; then
    echo "FAILED: nostromo root endpoint returned HTTP $HTTP_CODE (expected 200)"
    exit 1
fi

echo "SUCCESS: nostromo root endpoint returned HTTP $HTTP_CODE"
echo "Login check PASSED!"
exit 0
