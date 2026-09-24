#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18577}"
BASE_URL="${BASE_URL:-http://localhost:${HOST_PORT}}"

echo "Checking Mattermost health and API ping at ${BASE_URL}/api/v4/system/ping..."

MAX_RETRIES=20
COUNT=0

while [ $COUNT -lt $MAX_RETRIES ]; do
    RESPONSE=$(curl -s -w "\n%{http_code}" "${BASE_URL}/api/v4/system/ping" || true)
    HTTP_CODE=$(echo "$RESPONSE" | tail -n1)
    BODY=$(echo "$RESPONSE" | sed '$d')

    if [ "$HTTP_CODE" -eq 200 ] && echo "$BODY" | grep -qi "OK"; then
        echo "SUCCESS: Mattermost API ping responded with HTTP 200 OK (${BODY})"
        exit 0
    fi

    echo "Waiting for Mattermost API ping (attempt $((COUNT + 1))/${MAX_RETRIES}, HTTP ${HTTP_CODE})..."
    sleep 2
    COUNT=$((COUNT + 1))
done

echo "FAILED: Mattermost API ping failed after ${MAX_RETRIES} attempts (HTTP ${HTTP_CODE})"
exit 1
