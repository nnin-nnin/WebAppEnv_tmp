#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18598}"
URL="http://127.0.0.1:${HOST_PORT}"

echo "Checking CKAN service health at $URL..."

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${URL}/user/login" || true)
if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: CKAN login endpoint returned HTTP $HTTP_CODE"
else
    echo "FAILED: CKAN login endpoint returned HTTP $HTTP_CODE"
    exit 1
fi

API_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${URL}/api/3/action/status_show" || true)
if [ "$API_CODE" -eq 200 ]; then
    echo "SUCCESS: CKAN status API returned HTTP $API_CODE"
else
    echo "FAILED: CKAN status API returned HTTP $API_CODE"
    exit 1
fi

if [ -x "$APP_DIR/resources/login.sh" ]; then
    "$APP_DIR/resources/login.sh"
fi

echo "Health check PASSED!"
