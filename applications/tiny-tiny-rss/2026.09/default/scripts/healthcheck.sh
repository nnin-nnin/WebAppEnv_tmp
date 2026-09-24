#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18593}"
URL="http://localhost:${HOST_PORT}"

echo "Checking Tiny Tiny RSS service health at $URL..."

PAGE_CONTENT=$(curl -s -f "$URL/" || true)
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$URL/" || true)

if [ "$HTTP_CODE" -ge 200 ] && [ "$HTTP_CODE" -lt 400 ]; then
    echo "SUCCESS: Tiny Tiny RSS web endpoint returned HTTP $HTTP_CODE"
else
    echo "FAILED: Tiny Tiny RSS web endpoint returned HTTP $HTTP_CODE"
    exit 1
fi

if echo "$PAGE_CONTENT" | grep -qiE "(Tiny Tiny RSS|ttrss)"; then
    echo "SUCCESS: Tiny Tiny RSS web interface verified"
else
    echo "FAILED: Page content does not match Tiny Tiny RSS"
    exit 1
fi

if [ -x "$APP_DIR/resources/login.sh" ]; then
    "$APP_DIR/resources/login.sh"
fi

echo "Health check PASSED!"
