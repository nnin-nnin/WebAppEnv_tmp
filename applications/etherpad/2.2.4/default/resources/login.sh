#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18692}"
BASE_URL="http://${HOST:-127.0.0.1}:${HOST_PORT}"

echo "Checking Etherpad entrypoint at ${BASE_URL}..."

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)
if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: Etherpad entrypoint accessible (HTTP 200)"
    exit 0
else
    echo "FAILED: Expected HTTP 200 from ${BASE_URL}/, got ${HTTP_CODE}"
    exit 1
fi
