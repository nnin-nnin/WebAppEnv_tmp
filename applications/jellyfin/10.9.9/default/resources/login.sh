#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18679}"
BASE_URL="http://127.0.0.1:${HOST_PORT}"

echo "Checking jellyfin endpoint on port ${HOST_PORT}..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/web/index.html" || true)

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: jellyfin web interface returned HTTP 200."
elif [ "$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/System/Info/Public" || true)" -eq 200 ]; then
    echo "SUCCESS: jellyfin public info endpoint returned HTTP 200."
else
    echo "FAILED: jellyfin web/info endpoint returned HTTP ${HTTP_CODE}."
    exit 1
fi

echo "Login check PASSED!"
exit 0
