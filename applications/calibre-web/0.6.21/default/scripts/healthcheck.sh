#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18653}"
BASE_URL="http://127.0.0.1:${HOST_PORT}"

echo "Checking Calibre-Web service health at $BASE_URL..."

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/login" || true)
if [ "$HTTP_CODE" -ne 200 ]; then
    HTTP_CODE=$(curl -s -L -o /dev/null -w "%{http_code}" "$BASE_URL/" || true)
fi

if [ "$HTTP_CODE" -ne 200 ]; then
    echo "FAILED: Calibre-Web interface returned HTTP $HTTP_CODE (expected 200)"
    exit 1
fi

PAGE_CONTENT=$(curl -sL "$BASE_URL/" || true)
if echo "$PAGE_CONTENT" | grep -qiE "(Calibre-Web|login|dbconfig)"; then
    echo "SUCCESS: Calibre-Web web interface verified"
else
    echo "FAILED: Page content does not match Calibre-Web"
    exit 1
fi

if [ -x "$APP_DIR/resources/login.sh" ]; then
    "$APP_DIR/resources/login.sh"
fi

echo "Health check PASSED!"
