#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18612}"
URL="http://localhost:${HOST_PORT}"

echo "Checking Odoo service health at $URL..."

HTTP_CODE=$(curl -s -L -o /dev/null -w "%{http_code}" "$URL/" || true)

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: Odoo web endpoint returned HTTP $HTTP_CODE"
else
    echo "FAILED: Odoo web endpoint returned HTTP $HTTP_CODE"
    exit 1
fi

PAGE_CONTENT=$(curl -s -L "$URL/" || true)
if echo "$PAGE_CONTENT" | grep -qiE "(Odoo|<title>Odoo</title>)"; then
    echo "SUCCESS: Odoo web interface verified"
else
    echo "FAILED: Page content does not match Odoo"
    exit 1
fi

if [ -x "$APP_DIR/resources/login.sh" ]; then
    "$APP_DIR/resources/login.sh"
fi

echo "Health check PASSED!"
