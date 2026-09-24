#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18572}"
BASE_URL="http://localhost:${HOST_PORT}"
USER="${APP_USER:-${ADMIN_USER:-admin}}"
PASS="${APP_PASSWORD:-${ADMIN_PASSWORD:-admin}}"

echo "Verifying ActiveMQ Web Console authentication at ${BASE_URL}/admin/..."

# Construct HTTP Basic Auth header
AUTH_HEADER="Basic $(printf '%s:%s' "$USER" "$PASS" | base64 | tr -d '\r\n')"

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -H "Authorization: ${AUTH_HEADER}" "${BASE_URL}/admin/")
if [ "$HTTP_CODE" -ne 200 ]; then
    echo "FAILED: Web Console authentication failed with HTTP ${HTTP_CODE}"
    exit 1
fi

echo "SUCCESS: ActiveMQ Web Console authentication verified successfully (HTTP ${HTTP_CODE})"
exit 0
