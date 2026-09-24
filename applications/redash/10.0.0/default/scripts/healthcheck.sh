#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18610}"
URL="http://127.0.0.1:${HOST_PORT}"

echo "Checking Redash service health at $URL..."

PING_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${URL}/ping" || true)
if [ "$PING_CODE" -eq 200 ]; then
    echo "SUCCESS: Redash ping endpoint returned HTTP $PING_CODE"
else
    echo "FAILED: Redash ping endpoint returned HTTP $PING_CODE"
    exit 1
fi

LOGIN_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${URL}/login" || true)
if [ "$LOGIN_CODE" -eq 200 ]; then
    echo "SUCCESS: Redash login endpoint returned HTTP $LOGIN_CODE"
else
    echo "FAILED: Redash login endpoint returned HTTP $LOGIN_CODE"
    exit 1
fi

if [ -x "$APP_DIR/resources/login.sh" ]; then
    "$APP_DIR/resources/login.sh"
fi

echo "Health check PASSED!"
