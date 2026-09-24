#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18605}"
URL="http://localhost:${HOST_PORT}/"

echo "Checking October CMS service health at $URL..."
HTTP_CODE=$(curl -sI -o /dev/null -w "%{http_code}" "$URL" || true)

if [ "$HTTP_CODE" -ge 200 ] && [ "$HTTP_CODE" -lt 400 ]; then
    echo "SUCCESS: October CMS returned HTTP $HTTP_CODE!"
    exit 0
else
    echo "FAILED: October CMS returned HTTP $HTTP_CODE"
    exit 1
fi
