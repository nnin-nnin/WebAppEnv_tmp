#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18598}"
BASE_URL="${BASE_URL:-http://localhost:${HOST_PORT}}"

echo "Checking CKAN service and login page at ${BASE_URL}/user/login..."

MAX_RETRIES=30
COUNT=0

while [ $COUNT -lt $MAX_RETRIES ]; do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/user/login" || true)

    if [ "$HTTP_CODE" -eq 200 ]; then
        echo "SUCCESS: CKAN login page responded with HTTP 200 OK"
        exit 0
    fi

    echo "Waiting for CKAN login endpoint (attempt $((COUNT + 1))/${MAX_RETRIES}, HTTP ${HTTP_CODE})..."
    sleep 2
    COUNT=$((COUNT + 1))
done

echo "FAILED: CKAN login check failed after ${MAX_RETRIES} attempts (HTTP ${HTTP_CODE})"
exit 1
