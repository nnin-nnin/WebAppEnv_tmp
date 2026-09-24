#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18588}"
URL="http://localhost:${HOST_PORT}/login"

echo "Checking LibreNMS service health at $URL..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$URL")

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: LibreNMS login endpoint returned HTTP $HTTP_CODE!"
    echo "Health check PASSED!"
    exit 0
elif [ "$HTTP_CODE" -eq 302 ]; then
    echo "SUCCESS: LibreNMS returned HTTP 302 redirect!"
    echo "Health check PASSED!"
    exit 0
else
    echo "FAILED: LibreNMS returned HTTP $HTTP_CODE"
    exit 1
fi
