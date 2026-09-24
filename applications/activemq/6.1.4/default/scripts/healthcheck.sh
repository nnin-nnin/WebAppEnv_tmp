#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18614}"
URL="http://127.0.0.1:${HOST_PORT}/admin/"
USER="${APP_USER:-${ADMIN_USER:-admin}}"
PASS="${APP_PASSWORD:-${ADMIN_PASSWORD:-admin}}"

echo "Checking Apache ActiveMQ health at ${URL}..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -u "${USER}:${PASS}" "${URL}" || true)

if [ "$HTTP_CODE" -eq 200 ] || [ "$HTTP_CODE" -eq 401 ]; then
    echo "SUCCESS: ActiveMQ web server returned HTTP ${HTTP_CODE}!"
    exit 0
else
    echo "FAILED: ActiveMQ web server returned HTTP ${HTTP_CODE}"
    exit 1
fi
