#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18826}"
URL="${BASE_URL:-http://127.0.0.1:${HOST_PORT}}"

echo "Checking Fluentd UI service health at ${URL}..."

# Step 1: Check root web endpoint returns HTTP 200 or 302
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${URL}/" || true)
if [ "$HTTP_CODE" -eq 200 ] || [ "$HTTP_CODE" -eq 302 ]; then
    echo "SUCCESS: Fluentd UI web endpoint returned HTTP ${HTTP_CODE}"
else
    echo "FAILED: Fluentd UI web endpoint returned HTTP ${HTTP_CODE} (expected 200 or 302)"
    exit 1
fi

# Step 2: Check login page responds with HTTP 200 and contains Fluentd UI
PAGE_CONTENT=$(curl -sL "${URL}/sessions/new" || true)
if echo "$PAGE_CONTENT" | grep -qiE "(Fluentd-UI|Fluentd UI)"; then
    echo "SUCCESS: Fluentd UI web interface verified"
else
    echo "FAILED: Page content does not match Fluentd UI"
    exit 1
fi

# Step 3: Run login verification
if [ -x "$APP_DIR/resources/login.sh" ]; then
    "$APP_DIR/resources/login.sh"
fi

echo "Health check PASSED!"
exit 0
