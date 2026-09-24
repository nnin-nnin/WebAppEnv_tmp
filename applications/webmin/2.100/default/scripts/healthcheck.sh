#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18626}"

if [ -n "$APP_URL" ]; then
    BASE_URL="$APP_URL"
elif [ -n "$BASE_URL" ]; then
    BASE_URL="$BASE_URL"
else
    if curl -s -k -o /dev/null -w "%{http_code}" "http://localhost:${HOST_PORT}/session_login.cgi" | grep -q "^200$"; then
        BASE_URL="http://localhost:${HOST_PORT}"
    else
        BASE_URL="https://localhost:${HOST_PORT}"
    fi
fi

echo "Checking Webmin service health at ${BASE_URL}..."
HTTP_CODE=$(curl -s -k -o /dev/null -w "%{http_code}" "${BASE_URL}/session_login.cgi")

if [ "$HTTP_CODE" -ge 200 ] && [ "$HTTP_CODE" -lt 400 ]; then
    echo "SUCCESS: Webmin returned HTTP $HTTP_CODE!"
else
    echo "FAILED: Webmin returned HTTP $HTTP_CODE"
    exit 1
fi

if [ -x "$APP_DIR/resources/login.sh" ]; then
    "$APP_DIR/resources/login.sh"
fi

echo "Health check PASSED!"
