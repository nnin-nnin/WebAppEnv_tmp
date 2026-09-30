#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18856}"
BASE_URL="http://${HOST:-127.0.0.1}:${HOST_PORT}"

echo "Checking Pico CMS entrypoint at ${BASE_URL}/..."

HTTP_CODE=$(curl -s -L -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)
if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: Pico CMS entrypoint accessible (HTTP 200)."
else
    echo "FAILED: Pico CMS entrypoint returned HTTP ${HTTP_CODE} (expected 200)."
    exit 1
fi

PAGE_CONTENT=$(curl -s -L "${BASE_URL}/" || true)
if echo "$PAGE_CONTENT" | grep -qiE "(Pico|flat file CMS|Making the web easy)"; then
    echo "SUCCESS: Pico CMS content verified."
else
    echo "FAILED: Page content does not match Pico CMS."
    exit 1
fi

exit 0
