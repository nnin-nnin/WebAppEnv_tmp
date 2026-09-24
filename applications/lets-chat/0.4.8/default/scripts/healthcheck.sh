#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18631}"
URL="http://127.0.0.1:${HOST_PORT}"

echo "Checking Let's Chat service health at $URL..."

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$URL")
if [ "$HTTP_CODE" = "200" ] || [ "$HTTP_CODE" = "302" ]; then
    echo "SUCCESS: Let's Chat root endpoint returned HTTP $HTTP_CODE"
else
    echo "FAILED: Let's Chat root endpoint returned HTTP $HTTP_CODE"
    exit 1
fi

LOGIN_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$URL/login")
if [ "$LOGIN_CODE" = "200" ]; then
    echo "SUCCESS: Let's Chat login page returned HTTP $LOGIN_CODE"
else
    echo "FAILED: Let's Chat login page returned HTTP $LOGIN_CODE"
    exit 1
fi

if [ -x "$APP_DIR/resources/login.sh" ]; then
    "$APP_DIR/resources/login.sh"
fi

echo "Health check PASSED!"
