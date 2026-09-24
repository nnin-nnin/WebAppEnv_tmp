#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18615}"
URL="http://localhost:${HOST_PORT}"

echo "Checking Apache Archiva service health at $URL..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$URL/")

if [ "$HTTP_CODE" -ge 200 ] && [ "$HTTP_CODE" -lt 400 ]; then
    echo "SUCCESS: Apache Archiva web endpoint returned HTTP $HTTP_CODE!"
else
    echo "FAILED: Apache Archiva web endpoint returned HTTP $HTTP_CODE"
    exit 1
fi

PING_RESP=$(curl -s -H "Origin: $URL" "$URL/restServices/archivaServices/pingService/ping" 2>/dev/null || true)
if echo "$PING_RESP" | grep -q "Yeah Baby It rocks!"; then
    echo "SUCCESS: Archiva pingService is healthy!"
else
    echo "FAILED: Archiva pingService did not return expected response"
    exit 1
fi

if [ -x "$APP_DIR/resources/login.sh" ]; then
    "$APP_DIR/resources/login.sh"
fi

echo "Health check PASSED!"
