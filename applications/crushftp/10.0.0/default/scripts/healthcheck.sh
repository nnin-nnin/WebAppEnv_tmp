#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18634}"
URL="http://localhost:${HOST_PORT}/WebInterface/login.html"

echo "Checking CrushFTP service health at $URL..."
HTTP_CODE=$(curl -s -H "Connection: close" --max-time 10 -o /dev/null -w "%{http_code}" "$URL" || true)

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: CrushFTP login page returned HTTP $HTTP_CODE!"
else
    ROOT_CODE=$(curl -s -H "Connection: close" --max-time 10 -o /dev/null -w "%{http_code}" "http://localhost:${HOST_PORT}/" || true)
    if [ "$ROOT_CODE" -eq 200 ] || [ "$ROOT_CODE" -eq 302 ]; then
        echo "SUCCESS: CrushFTP root endpoint returned HTTP $ROOT_CODE!"
    else
        echo "FAILED: CrushFTP web server returned HTTP ${HTTP_CODE}"
        exit 1
    fi
fi

if [ -x "$APP_DIR/resources/login.sh" ]; then
    "$APP_DIR/resources/login.sh"
fi

echo "Health check PASSED!"
