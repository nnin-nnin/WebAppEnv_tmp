#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18580}"
URL="http://localhost:${HOST_PORT}"

echo "Checking Cockpit service health at $URL..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${URL}/auth/login" || true)

if [ "$HTTP_CODE" -ge 200 ] && [ "$HTTP_CODE" -lt 400 ]; then
    echo "SUCCESS: Cockpit returned HTTP $HTTP_CODE!"
else
    HTTP_CODE_ROOT=$(curl -s -o /dev/null -w "%{http_code}" "${URL}/" || true)
    if [ "$HTTP_CODE_ROOT" -ge 200 ] && [ "$HTTP_CODE_ROOT" -lt 400 ]; then
        echo "SUCCESS: Cockpit root returned HTTP $HTTP_CODE_ROOT!"
    else
        echo "FAILED: Cockpit returned HTTP $HTTP_CODE (root: $HTTP_CODE_ROOT)"
        docker compose -f "$APP_DIR/docker/compose.yaml" ps
        exit 1
    fi
fi

if [ -x "$APP_DIR/resources/login.sh" ]; then
    "$APP_DIR/resources/login.sh"
fi

echo "Health check PASSED!"
