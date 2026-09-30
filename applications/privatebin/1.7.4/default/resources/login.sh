#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18666}"
BASE_URL="${BASE_URL:-http://127.0.0.1:${HOST_PORT}}"

echo "Testing PrivateBin endpoint at ${BASE_URL}..."

HTTP_CODE=$(curl -s -L -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)
if [ "$HTTP_CODE" -ne 200 ]; then
    echo "FAILED: http://127.0.0.1:${HOST_PORT}/ returned HTTP ${HTTP_CODE} (expected 200)"
    exit 1
fi

PAGE_CONTENT=$(curl -s -L "${BASE_URL}/" || true)
if echo "$PAGE_CONTENT" | grep -qiE "(PrivateBin)"; then
    echo "SUCCESS: http://127.0.0.1:${HOST_PORT}/ returned 200 and page content verified"
    exit 0
fi

echo "FAILED: PrivateBin verification failed"
exit 1
