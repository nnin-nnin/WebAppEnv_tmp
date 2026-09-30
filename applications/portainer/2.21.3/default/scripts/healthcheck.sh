#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18655}"
BASE_URL="http://127.0.0.1:${HOST_PORT}"

echo "Checking Portainer service health at $BASE_URL..."

# Step 1: Check root endpoint
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/" || true)
if [ "$HTTP_CODE" -ne 200 ] && [ "$HTTP_CODE" -ne 302 ]; then
    echo "FAILED: Portainer root endpoint returned HTTP $HTTP_CODE (expected 200 or 302)"
    exit 1
fi

# Step 2: Check API status
STATUS_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/api/status" || true)
if [ "$STATUS_CODE" -ne 200 ]; then
    echo "FAILED: Portainer /api/status returned HTTP $STATUS_CODE (expected 200)"
    exit 1
fi

# Step 3: Run login check
if [ -x "$APP_DIR/resources/login.sh" ]; then
    "$APP_DIR/resources/login.sh"
fi

echo "Health check PASSED!"
exit 0
