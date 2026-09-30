#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18662}"
URL="http://127.0.0.1:${HOST_PORT}/"

echo "Checking nginx-proxy-manager health at ${URL}..."

HTTP_CODE=$(curl -s -L -o /dev/null -w "%{http_code}" "$URL" || true)

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: nginx-proxy-manager health endpoint returned HTTP 200."
else
    echo "FAILED: nginx-proxy-manager health endpoint returned HTTP ${HTTP_CODE}."
    exit 1
fi

if [ -x "$APP_DIR/resources/login.sh" ]; then
    "$APP_DIR/resources/login.sh"
fi

echo "Health check PASSED!"
