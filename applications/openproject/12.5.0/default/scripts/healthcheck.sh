#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18646}"
URL="http://127.0.0.1:${HOST_PORT}/login"

echo "Checking OpenProject service health at $URL..."
HTTP_CODE=$(curl --noproxy "*" -s -o /dev/null -w "%{http_code}" "$URL")

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: OpenProject returned HTTP $HTTP_CODE!"
else
    echo "FAILED: OpenProject returned HTTP $HTTP_CODE"
    exit 1
fi

if [ -x "$APP_DIR/resources/login.sh" ]; then
    "$APP_DIR/resources/login.sh"
fi

echo "Health check PASSED!"
