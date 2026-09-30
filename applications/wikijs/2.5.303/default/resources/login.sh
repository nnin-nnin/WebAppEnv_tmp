#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18659}"
BASE_URL="${BASE_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-${USER:-admin}}}}"
PASSWORD="${ADMIN_PASSWORD:-${APP_PASSWORD:-${PASSWORD:-Admin123456!}}}"

echo "Testing Wiki.js access at ${BASE_URL}..."

# Check web accessibility
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)
if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: Wiki.js web interface returned HTTP 200"
    exit 0
else
    echo "FAILED: Wiki.js web interface returned HTTP ${HTTP_CODE} (expected 200)"
    exit 1
fi
