#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18613}"
BASE_URL="http://localhost:${HOST_PORT}"

echo "Checking ChatDev service and visualizer endpoint at ${BASE_URL}..."

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/")

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: ChatDev visualizer root endpoint returned HTTP $HTTP_CODE"
    exit 0
else
    echo "FAILED: ChatDev visualizer returned HTTP $HTTP_CODE"
    exit 1
fi
