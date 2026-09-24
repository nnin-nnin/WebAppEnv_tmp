#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18577}"
URL="http://127.0.0.1:${HOST_PORT}"

echo "Checking Mattermost service health at $URL..."

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$URL")
if [ "$HTTP_CODE" -ge 200 ] && [ "$HTTP_CODE" -lt 400 ]; then
    echo "SUCCESS: Mattermost frontend returned HTTP $HTTP_CODE"
else
    echo "FAILED: Mattermost frontend returned HTTP $HTTP_CODE"
    exit 1
fi

PING_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$URL/api/v4/system/ping")
if [ "$PING_CODE" = "200" ]; then
    echo "SUCCESS: Mattermost API ping returned HTTP $PING_CODE"
else
    echo "FAILED: Mattermost API ping returned HTTP $PING_CODE"
    exit 1
fi

if [ -x "$APP_DIR/resources/login.sh" ]; then
    "$APP_DIR/resources/login.sh"
fi

echo "Health check PASSED!"
