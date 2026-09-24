#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18634}"
BASE_URL="http://localhost:${HOST_PORT}"

echo "Checking CrushFTP login endpoint at ${BASE_URL}/WebInterface/login.html..."

HTTP_CODE=$(curl -s -H "Connection: close" --max-time 10 -o /dev/null -w "%{http_code}" "${BASE_URL}/WebInterface/login.html" || true)

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: CrushFTP login endpoint returned HTTP ${HTTP_CODE}"
    exit 0
fi

ROOT_CODE=$(curl -s -H "Connection: close" --max-time 10 -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)
if [ "$ROOT_CODE" -eq 200 ] || [ "$ROOT_CODE" -eq 302 ]; then
    echo "SUCCESS: CrushFTP service reachable at ${BASE_URL} (HTTP ${ROOT_CODE})"
    exit 0
fi

echo "FAILED: CrushFTP login endpoint returned HTTP ${HTTP_CODE}"
exit 1
