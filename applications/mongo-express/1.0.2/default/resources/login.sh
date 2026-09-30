#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18688}"
ADMIN_USER="${APP_USER:-admin}"
ADMIN_PASS="${APP_PASSWORD:-pass}"
BASE_URL="http://${ADMIN_USER}:${ADMIN_PASS}@${HOST:-127.0.0.1}:${HOST_PORT}"

echo "Checking Mongo Express authentication at ${BASE_URL}/..."

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)
if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: Mongo Express authenticated successfully (HTTP 200)"
    exit 0
else
    echo "FAILED: Expected HTTP 200 from ${BASE_URL}/, got ${HTTP_CODE}"
    exit 1
fi
