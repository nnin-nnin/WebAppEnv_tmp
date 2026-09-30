#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18659}"
URL="http://127.0.0.1:${HOST_PORT}"

echo "Checking Wiki.js service health at $URL..."

PAGE_CONTENT=$(curl -s -f "$URL/" || true)
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$URL/" || true)

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: Wiki.js web endpoint returned HTTP $HTTP_CODE"
else
    echo "FAILED: Wiki.js web endpoint returned HTTP $HTTP_CODE"
    exit 1
fi

if echo "$PAGE_CONTENT" | grep -qiE "(Wiki\.js|Wiki\.js Setup|setup wiki-version)"; then
    echo "SUCCESS: Wiki.js web interface content verified"
else
    echo "FAILED: Page content does not match Wiki.js"
    exit 1
fi

if [ -x "$APP_DIR/resources/login.sh" ]; then
    "$APP_DIR/resources/login.sh"
fi

echo "Health check PASSED!"
