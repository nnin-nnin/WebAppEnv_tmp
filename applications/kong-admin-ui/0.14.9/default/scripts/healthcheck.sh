#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18641}"
URL="http://127.0.0.1:${HOST_PORT}/"

echo "Checking kong-admin-ui health at ${URL}..."

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$URL" || true)

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: kong-admin-ui health endpoint returned HTTP 200."
elif [ "$HTTP_CODE" -eq 302 ]; then
    HTTP_CODE_L=$(curl -s -L -o /dev/null -w "%{http_code}" "$URL" || true)
    if [ "$HTTP_CODE_L" -eq 200 ]; then
        echo "SUCCESS: kong-admin-ui health endpoint returned HTTP 200 via redirect."
    else
        echo "FAILED: kong-admin-ui health endpoint returned HTTP ${HTTP_CODE}."
        exit 1
    fi
else
    echo "FAILED: kong-admin-ui health endpoint returned HTTP ${HTTP_CODE}."
    exit 1
fi

if [ -x "$APP_DIR/resources/login.sh" ]; then
    "$APP_DIR/resources/login.sh"
fi

echo "Health check PASSED!"
