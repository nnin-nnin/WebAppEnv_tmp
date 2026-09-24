#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18581}"
URL="http://localhost:${HOST_PORT}/login"

echo "Checking Jenkins health at ${URL}..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${URL}" || true)

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: Jenkins web server returned HTTP $HTTP_CODE!"
    exit 0
else
    echo "FAILED: Jenkins web server returned HTTP ${HTTP_CODE}"
    exit 1
fi
