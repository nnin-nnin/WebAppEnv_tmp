#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18686}"
BASE_URL="http://${HOST:-127.0.0.1}:${HOST_PORT}"

echo "Checking Adminer entrypoint at ${BASE_URL}/..."

HTTP_CODE=$(curl -s -L -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)
if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: Adminer login entrypoint returned HTTP 200."
    exit 0
else
    echo "FAILED: Adminer login entrypoint returned HTTP ${HTTP_CODE} (expected 200)."
    exit 1
fi
