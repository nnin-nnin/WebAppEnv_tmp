#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18572}"
URL="http://localhost:${HOST_PORT}/"

echo "Checking Apache ActiveMQ health at ${URL}..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${URL}" || true)

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: ActiveMQ web server returned HTTP $HTTP_CODE!"
    exit 0
else
    echo "FAILED: ActiveMQ web server returned HTTP ${HTTP_CODE}"
    exit 1
fi
