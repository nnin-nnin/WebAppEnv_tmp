#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18613}"
URL="http://localhost:${HOST_PORT}"

echo "Checking ChatDev service health at $URL..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$URL/")

if [ "$HTTP_CODE" -ge 200 ] && [ "$HTTP_CODE" -lt 400 ]; then
    echo "SUCCESS: ChatDev returned HTTP $HTTP_CODE!"
else
    echo "FAILED: ChatDev returned HTTP $HTTP_CODE"
    exit 1
fi

if [ -x "$APP_DIR/resources/login.sh" ]; then
    "$APP_DIR/resources/login.sh"
fi

echo "Health check PASSED!"
