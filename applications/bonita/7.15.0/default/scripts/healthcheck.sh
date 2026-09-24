#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18578}"
URL="http://localhost:${HOST_PORT}/bonita/"

echo "Checking Bonita BPM health at ${URL}..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${URL}" || true)

if [ "$HTTP_CODE" -eq 200 ] || [ "$HTTP_CODE" -eq 302 ]; then
    echo "SUCCESS: Bonita web endpoint returned HTTP $HTTP_CODE!"
else
    echo "FAILED: Bonita web endpoint returned HTTP ${HTTP_CODE}"
    exit 1
fi

if [ -x "$APP_DIR/resources/login.sh" ]; then
    "$APP_DIR/resources/login.sh"
fi

echo "Health check PASSED!"
