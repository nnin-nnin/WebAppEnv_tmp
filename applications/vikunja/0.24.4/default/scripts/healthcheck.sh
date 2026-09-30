#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18661}"
BASE_URL="http://127.0.0.1:${HOST_PORT}"

echo "Checking Vikunja service health at $BASE_URL..."

INFO_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/api/v1/info" || true)
if [ "$INFO_CODE" -ne 200 ]; then
    echo "FAILED: Vikunja info endpoint returned HTTP $INFO_CODE (expected 200)"
    exit 1
fi

ROOT_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/" || true)
if [ "$ROOT_CODE" -ne 200 ]; then
    echo "FAILED: Vikunja root endpoint returned HTTP $ROOT_CODE (expected 200)"
    exit 1
fi

PAGE_CONTENT=$(curl -s -L "$BASE_URL/" || true)
if echo "$PAGE_CONTENT" | grep -qiE "(Vikunja|vikunja)"; then
    echo "SUCCESS: Vikunja web interface verified"
else
    echo "FAILED: Page content does not match Vikunja"
    exit 1
fi

if [ -x "$APP_DIR/resources/login.sh" ]; then
    "$APP_DIR/resources/login.sh"
fi

echo "Health check PASSED!"
