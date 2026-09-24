#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18609}"
BASE_URL="${BASE_URL:-http://127.0.0.1:${HOST_PORT}}"

echo "Checking Mattermost login and service endpoint at ${BASE_URL}..."

MAX_RETRIES=20
COUNT=0

while [ $COUNT -lt $MAX_RETRIES ]; do
    LOGIN_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/login" || true)
    PING_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/api/v4/system/ping" || true)

    if ([ "$LOGIN_CODE" -ge 200 ] && [ "$LOGIN_CODE" -lt 400 ]) || [ "$PING_CODE" = "200" ]; then
        echo "SUCCESS: Mattermost verified (login HTTP ${LOGIN_CODE}, ping HTTP ${PING_CODE})"
        exit 0
    fi

    echo "Waiting for Mattermost endpoint (attempt $((COUNT + 1))/${MAX_RETRIES}, login HTTP ${LOGIN_CODE}, ping HTTP ${PING_CODE})..."
    sleep 2
    COUNT=$((COUNT + 1))
done

echo "FAILED: Mattermost endpoint verification failed after ${MAX_RETRIES} attempts (login HTTP ${LOGIN_CODE}, ping HTTP ${PING_CODE})"
exit 1
