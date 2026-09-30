#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18653}"
BASE_URL="http://127.0.0.1:${HOST_PORT}"

echo "Checking Miniflux service health at $BASE_URL..."

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/" || true)
if [ "$HTTP_CODE" -ne 200 ]; then
    echo "FAILED: Miniflux root endpoint returned HTTP $HTTP_CODE (expected 200)"
    exit 1
fi

HEALTH_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/healthcheck" || true)
if [ "$HEALTH_CODE" -ne 200 ]; then
    echo "FAILED: Miniflux /healthcheck returned HTTP $HEALTH_CODE"
    exit 1
fi

PAGE_CONTENT=$(curl -s "$BASE_URL/" || true)
if echo "$PAGE_CONTENT" | grep -qiE "(Miniflux|Sign In)"; then
    echo "SUCCESS: Miniflux web interface verified"
else
    echo "FAILED: Page content does not match Miniflux"
    exit 1
fi

if [ -x "$APP_DIR/resources/login.sh" ]; then
    "$APP_DIR/resources/login.sh"
fi

echo "Health check PASSED!"
