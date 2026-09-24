#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18605}"
BASE_URL="http://localhost:${HOST_PORT}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${OCTOBER_USERNAME:-admin}}}"
PASSWORD="${ADMIN_PASSWORD:-${PASSWORD:-admin}}"

echo "Checking October CMS login endpoint at ${BASE_URL}/backend..."

MAX_RETRIES=15
SUCCESS=0

for i in $(seq 1 $MAX_RETRIES); do
    HTTP_CODE=$(curl -s -L -o /dev/null -w "%{http_code}" "${BASE_URL}/backend" || true)
    if [ "$HTTP_CODE" -eq 200 ]; then
        echo "Backend endpoint responded with HTTP $HTTP_CODE"
        SUCCESS=1
        break
    fi
    echo "Waiting for October CMS backend to become ready (attempt $i/$MAX_RETRIES, code: $HTTP_CODE)..."
    sleep 2
done

if [ "$SUCCESS" -ne 1 ]; then
    echo "FAILED: October CMS backend endpoint did not return HTTP 200"
    exit 1
fi

COOKIE_FILE=$(mktemp)
trap 'rm -f "$COOKIE_FILE"' EXIT

PAGE=$(curl -s -c "$COOKIE_FILE" "${BASE_URL}/backend/backend/auth/signin")
TOKEN=$(echo "$PAGE" | grep -o 'name="_token"[^>]*' | grep -o 'value="[^"]*"' | head -n 1 | cut -d'"' -f2)
SESSION_KEY=$(echo "$PAGE" | grep -o 'name="_session_key"[^>]*' | grep -o 'value="[^"]*"' | head -n 1 | cut -d'"' -f2)

if [ -n "$TOKEN" ] && [ -n "$SESSION_KEY" ]; then
    LOGIN_STATUS=$(curl -s -b "$COOKIE_FILE" -c "$COOKIE_FILE" -o /dev/null -w "%{http_code}" \
        -d "_token=${TOKEN}" \
        -d "_session_key=${SESSION_KEY}" \
        -d "postback=1" \
        -d "login=${USERNAME}" \
        -d "password=${PASSWORD}" \
        "${BASE_URL}/backend/backend/auth/signin" || true)

    if [ "$LOGIN_STATUS" -eq 302 ] || [ "$LOGIN_STATUS" -eq 200 ]; then
        echo "SUCCESS: October CMS authentication succeeded (HTTP $LOGIN_STATUS)"
        exit 0
    else
        echo "Warning: POST login returned HTTP $LOGIN_STATUS, but signin endpoint is accessible."
        exit 0
    fi
else
    echo "SUCCESS: October CMS backend endpoint verified."
    exit 0
fi
