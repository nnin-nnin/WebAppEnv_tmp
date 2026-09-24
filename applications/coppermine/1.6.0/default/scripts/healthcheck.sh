#!/usr/bin/env bash
set -e

# Strip local proxies
export http_proxy=""
export https_proxy=""
export HTTP_PROXY=""
export HTTPS_PROXY=""
export all_proxy=""
export ALL_PROXY=""
export no_proxy="*"
export NO_PROXY="*"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18632}"
URL="http://localhost:${HOST_PORT}/"

echo "Checking Coppermine service health at $URL..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -H "User-Agent: Mozilla/5.0" "$URL" 2>/dev/null || true)

if [ "$HTTP_CODE" -ge 200 ] && [ "$HTTP_CODE" -lt 400 ]; then
    echo "SUCCESS: Coppermine returned HTTP $HTTP_CODE!"
else
    echo "FAILED: Coppermine returned HTTP $HTTP_CODE"
    exit 1
fi

if [ -x "$APP_DIR/resources/login.sh" ]; then
    bash "$APP_DIR/resources/login.sh"
fi

echo "Health check PASSED!"
exit 0
