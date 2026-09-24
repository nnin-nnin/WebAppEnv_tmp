#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18625}"
URL="http://localhost:${HOST_PORT}/"

echo "Checking Zen Cart service health at $URL..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -H "User-Agent: Mozilla/5.0" "$URL" 2>/dev/null || true)

if [ "$HTTP_CODE" -ge 200 ] && [ "$HTTP_CODE" -lt 400 ]; then
    echo "SUCCESS: Zen Cart returned HTTP $HTTP_CODE!"
    exit 0
else
    echo "FAILED: Zen Cart returned HTTP $HTTP_CODE"
    exit 1
fi
