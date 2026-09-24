#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18568}"
URL="http://localhost:${HOST_PORT}/lists/admin/"

echo "Checking phpList service health at $URL..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$URL" 2>/dev/null || true)

if [ "$HTTP_CODE" -ge 200 ] && [ "$HTTP_CODE" -lt 400 ]; then
    echo "SUCCESS: phpList returned HTTP $HTTP_CODE!"
    exit 0
else
    echo "FAILED: phpList returned HTTP $HTTP_CODE"
    exit 1
fi
