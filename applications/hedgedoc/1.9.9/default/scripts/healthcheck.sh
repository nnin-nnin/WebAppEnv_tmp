#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18670}"
URL="http://127.0.0.1:${HOST_PORT}/"

echo "Checking HedgeDoc health at ${URL}..."

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$URL" || true)

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: HedgeDoc frontend returned HTTP 200."
else
    echo "FAILED: HedgeDoc frontend returned HTTP ${HTTP_CODE}."
    exit 1
fi

HEALTH_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/_health" || true)
if [ "$HEALTH_CODE" -eq 200 ]; then
    echo "SUCCESS: HedgeDoc /_health endpoint returned HTTP 200."
fi

if [ -x "$APP_DIR/resources/login.sh" ]; then
    "$APP_DIR/resources/login.sh"
fi

echo "Health check PASSED!"
