#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18642}"
URL="http://127.0.0.1:${HOST_PORT}"

echo "Checking FlaskBB service health at $URL..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$URL/")

if [ "$HTTP_CODE" -ge 200 ] && [ "$HTTP_CODE" -lt 400 ]; then
    echo "SUCCESS: FlaskBB returned HTTP $HTTP_CODE!"
else
    echo "FAILED: FlaskBB returned HTTP $HTTP_CODE"
    exit 1
fi

echo "Health check PASSED!"
