#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18556}"
URL="http://localhost:${HOST_PORT}"

echo "Checking Ghost service health at $URL..."

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$URL")
if [ "$HTTP_CODE" -ge 200 ] && [ "$HTTP_CODE" -lt 400 ]; then
    echo "SUCCESS: Ghost frontend returned HTTP $HTTP_CODE"
else
    echo "FAILED: Ghost frontend returned HTTP $HTTP_CODE"
    exit 1
fi

SETUP_STATUS=$(curl -s "$URL/ghost/api/admin/authentication/setup/" 2>/dev/null || true)
if echo "$SETUP_STATUS" | grep -q '"status":true'; then
    echo "SUCCESS: Ghost admin setup is completed"
else
    echo "FAILED: Ghost admin setup is not completed ($SETUP_STATUS)"
    exit 1
fi

if [ -x "$APP_DIR/resources/login.sh" ]; then
    "$APP_DIR/resources/login.sh"
fi

echo "Health check PASSED!"
