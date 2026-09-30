#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18657}"
URL="http://127.0.0.1:${HOST_PORT}"

echo "Checking Directus service health at $URL..."

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$URL/server/ping" || true)
if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: Directus /server/ping returned HTTP $HTTP_CODE"
else
    echo "FAILED: Directus /server/ping returned HTTP $HTTP_CODE"
    exit 1
fi

PAGE_CONTENT=$(curl -sL "$URL/server/ping" || true)
if echo "$PAGE_CONTENT" | grep -qi "pong"; then
    echo "SUCCESS: Directus /server/ping body verified"
else
    echo "FAILED: Directus /server/ping unexpected content: $PAGE_CONTENT"
    exit 1
fi

if [ -x "$APP_DIR/resources/login.sh" ]; then
    "$APP_DIR/resources/login.sh"
fi

echo "Directus health check PASSED!"
