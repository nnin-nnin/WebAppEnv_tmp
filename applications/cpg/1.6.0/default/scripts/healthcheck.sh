#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18758}"
BASE_URL="http://${HOST:-127.0.0.1}:${HOST_PORT}"

echo "Checking cpg service health at $BASE_URL..."

# Check API endpoint
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/v3/currencies/" || true)
if [ "$HTTP_CODE" -ne 200 ]; then
    echo "FAILED: cpg endpoint returned HTTP $HTTP_CODE (expected 200)"
    exit 1
fi

PAGE_CONTENT=$(curl -s "$BASE_URL/v3/currencies/" || true)
if echo "$PAGE_CONTENT" | grep -qiE "(USD|EUR|CNY)"; then
    echo "SUCCESS: cpg API service verified"
else
    echo "FAILED: Response content does not match expected cpg API output"
    exit 1
fi

if [ -x "$APP_DIR/resources/login.sh" ]; then
    "$APP_DIR/resources/login.sh"
fi

echo "Health check PASSED!"
