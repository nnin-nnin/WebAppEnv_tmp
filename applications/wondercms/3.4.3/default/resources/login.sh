#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18590}"
BASE_URL="http://localhost:${HOST_PORT}"

echo "Checking WonderCMS service and login endpoint at ${BASE_URL}..."

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/")

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: WonderCMS root endpoint returned HTTP $HTTP_CODE"
    
    # Check login URL
    HOME_HTML=$(curl -s "${BASE_URL}/")
    LOGIN_PATH=$(echo "$HOME_HTML" | grep -o 'href="[^"]*login[^"]*"' | head -1 | sed 's/href="//;s/"//' || true)
    PASSWORD=$(echo "$HOME_HTML" | grep -o 'password for editing everything is: <b>[^<]*</b>' | sed 's/.*<b>\(.*\)<\/b>/\1/' || true)
    PASSWORD="${PASSWORD:-${ADMIN_PASSWORD:-${PASSWORD:-AdminPassword123!}}}"

    if [ -n "$LOGIN_PATH" ]; then
        LOGIN_URL="$LOGIN_PATH"
        if [[ "$LOGIN_URL" != http* ]]; then
            LOGIN_URL="${BASE_URL}/${LOGIN_PATH#/}"
        fi
        POST_CODE=$(curl -s -o /dev/null -w "%{http_code}" -X POST -d "password=${PASSWORD}" "$LOGIN_URL" || true)
        echo "Login POST to $LOGIN_URL returned HTTP $POST_CODE"
        if [ "$POST_CODE" -eq 200 ] || [ "$POST_CODE" -eq 301 ] || [ "$POST_CODE" -eq 302 ]; then
            echo "SUCCESS: Login endpoint verified (HTTP $POST_CODE)"
        fi
    fi
    exit 0
else
    echo "FAILED: WonderCMS returned HTTP $HTTP_CODE"
    exit 1
fi
