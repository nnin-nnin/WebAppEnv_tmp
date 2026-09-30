#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18693}"
BASE_URL="http://${HOST:-127.0.0.1}:${HOST_PORT}"

echo "Checking Node-RED endpoint accessibility at ${BASE_URL}/..."

HTTP_CODE=$(curl -s -L -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)
if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: Node-RED entrypoint accessible (HTTP 200)"
else
    echo "FAILED: Expected HTTP 200 from ${BASE_URL}/, got ${HTTP_CODE}"
    exit 1
fi

PAGE_BODY=$(curl -sL "${BASE_URL}/" || true)
if echo "$PAGE_BODY" | grep -qi "Node-RED"; then
    echo "SUCCESS: Node-RED web interface confirmed"
else
    echo "FAILED: Node-RED marker not found in response"
    exit 1
fi

echo "Node-RED login check PASSED."
exit 0
