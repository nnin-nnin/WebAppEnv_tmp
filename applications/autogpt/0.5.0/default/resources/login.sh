#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18620}"
BASE_URL="http://localhost:${HOST_PORT}"

echo "Checking AutoGPT service endpoint at ${BASE_URL}..."

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/")

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: AutoGPT root endpoint returned HTTP $HTTP_CODE"
    exit 0
else
    echo "FAILED: AutoGPT returned HTTP $HTTP_CODE"
    exit 1
fi
