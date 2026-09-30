#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18693}"
URL="${BASE_URL:-http://127.0.0.1:${HOST_PORT}}"

echo "Checking Node-RED service health at ${URL}..."

# Step 1: Check root web endpoint returns HTTP 200
HTTP_CODE=$(curl -s -L -o /dev/null -w "%{http_code}" "${URL}/" || true)
if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: Node-RED web endpoint returned HTTP 200"
else
    echo "FAILED: Node-RED web endpoint returned HTTP ${HTTP_CODE} (expected 200)"
    exit 1
fi

# Step 2: Check page content contains Node-RED
PAGE_CONTENT=$(curl -sL "${URL}/" || true)
if echo "$PAGE_CONTENT" | grep -qiE "(Node-RED)"; then
    echo "SUCCESS: Node-RED web interface verified"
else
    echo "FAILED: Page content does not match Node-RED"
    exit 1
fi

# Step 3: Run login verification
if [ -x "$APP_DIR/resources/login.sh" ]; then
    "$APP_DIR/resources/login.sh"
fi

echo "Health check PASSED!"
exit 0
