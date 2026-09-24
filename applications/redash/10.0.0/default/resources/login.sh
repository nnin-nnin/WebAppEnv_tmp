#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18610}"
BASE_URL="${BASE_URL:-http://127.0.0.1:${HOST_PORT}}"

echo "Checking Redash service and login page at ${BASE_URL}/login..."

MAX_RETRIES=30
COUNT=0

while [ $COUNT -lt $MAX_RETRIES ]; do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/login" || true)

    if [ "$HTTP_CODE" -eq 200 ]; then
        echo "SUCCESS: Redash login page responded with HTTP 200 OK"
        exit 0
    fi

    echo "Waiting for Redash login endpoint (attempt $((COUNT + 1))/${MAX_RETRIES}, HTTP ${HTTP_CODE})..."
    sleep 2
    COUNT=$((COUNT + 1))
done

echo "FAILED: Redash login check failed after ${MAX_RETRIES} attempts (HTTP ${HTTP_CODE})"
exit 1
