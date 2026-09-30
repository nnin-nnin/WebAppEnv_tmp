#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18675}"
URL="http://127.0.0.1:${HOST_PORT}"

echo "Checking Fider service health at $URL..."

PAGE_CONTENT=$(curl -s "$URL/" || true)
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$URL/" || true)

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: Fider web endpoint returned HTTP $HTTP_CODE"
else
    echo "FAILED: Fider web endpoint returned HTTP $HTTP_CODE"
    exit 1
fi

if echo "$PAGE_CONTENT" | grep -qiE "(Fider|<title>Fider</title>)"; then
    echo "SUCCESS: Fider web interface content verified"
else
    echo "FAILED: Page content does not match Fider"
    exit 1
fi

if [ -x "$APP_DIR/resources/login.sh" ]; then
    "$APP_DIR/resources/login.sh"
fi

echo "Health check PASSED!"
