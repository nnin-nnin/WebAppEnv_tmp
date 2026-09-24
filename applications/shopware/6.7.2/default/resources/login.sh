#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18595}"
BASE_URL="http://localhost:${HOST_PORT}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${SHOPWARE_USERNAME:-admin}}}"
PASSWORD="${ADMIN_PASSWORD:-${PASSWORD:-shopware}}"

echo "Checking Shopware login endpoint at ${BASE_URL}/admin..."

MAX_RETRIES=10
HTTP_CODE=0
for i in $(seq 1 $MAX_RETRIES); do
    HTTP_CODE=$(curl -sI -o /dev/null -w "%{http_code}" "${BASE_URL}/admin" || true)
    if [ "$HTTP_CODE" -eq 200 ] || [ "$HTTP_CODE" -eq 301 ] || [ "$HTTP_CODE" -eq 302 ]; then
        break
    fi
    sleep 2
done

if [ "$HTTP_CODE" -eq 200 ] || [ "$HTTP_CODE" -eq 301 ] || [ "$HTTP_CODE" -eq 302 ]; then
    echo "SUCCESS: Shopware admin endpoint reachable (HTTP $HTTP_CODE)"
    exit 0
else
    echo "FAILED: Shopware admin endpoint returned HTTP $HTTP_CODE"
    exit 1
fi
