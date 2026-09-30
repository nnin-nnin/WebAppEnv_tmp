#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18671}"
BASE_URL="http://127.0.0.1:${HOST_PORT}"

echo "Checking wallabag service health at ${BASE_URL}..."

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/login" || true)

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: wallabag login endpoint returned HTTP $HTTP_CODE"
else
    echo "FAILED: wallabag login endpoint returned HTTP $HTTP_CODE"
    exit 1
fi

PAGE_CONTENT=$(curl -sL "${BASE_URL}/login" || true)
if echo "$PAGE_CONTENT" | grep -qiE "(wallabag)"; then
    echo "SUCCESS: wallabag web interface verified"
else
    echo "FAILED: Page content does not match wallabag"
    exit 1
fi

if [ -x "$APP_DIR/resources/login.sh" ]; then
    "$APP_DIR/resources/login.sh"
fi

echo "Health check PASSED!"
