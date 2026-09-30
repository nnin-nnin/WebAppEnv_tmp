#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18652}"
URL="http://127.0.0.1:${HOST_PORT}"

echo "Checking FreshRSS service health at $URL..."

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$URL/" || true)

if [ "$HTTP_CODE" -ge 200 ] && [ "$HTTP_CODE" -lt 400 ]; then
    echo "SUCCESS: FreshRSS web endpoint returned HTTP $HTTP_CODE"
else
    echo "FAILED: FreshRSS web endpoint returned HTTP $HTTP_CODE"
    exit 1
fi

PAGE_CONTENT=$(curl -sL "$URL/" || true)
if echo "$PAGE_CONTENT" | grep -qiE "(FreshRSS)"; then
    echo "SUCCESS: FreshRSS web interface verified"
else
    echo "FAILED: Page content does not match FreshRSS"
    exit 1
fi

if [ -x "$APP_DIR/resources/login.sh" ]; then
    "$APP_DIR/resources/login.sh"
fi

echo "Health check PASSED!"
