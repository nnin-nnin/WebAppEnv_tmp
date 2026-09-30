#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18851}"
STORE_URL="http://127.0.0.1:${HOST_PORT}/"
ADMIN_URL="http://127.0.0.1:${HOST_PORT}/admin/"

echo "Checking OXID eShop health at ${STORE_URL}..."

# 1. Check storefront HTTP status
STORE_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$STORE_URL")
if [ "$STORE_CODE" -ge 200 ] && [ "$STORE_CODE" -lt 400 ]; then
    echo "SUCCESS: Storefront returned HTTP $STORE_CODE"
else
    echo "FAILED: Storefront returned HTTP $STORE_CODE"
    exit 1
fi

# 2. Check admin page HTTP status
ADMIN_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$ADMIN_URL")
if [ "$ADMIN_CODE" -ge 200 ] && [ "$ADMIN_CODE" -lt 400 ]; then
    echo "SUCCESS: Admin console returned HTTP $ADMIN_CODE"
else
    echo "FAILED: Admin console returned HTTP $ADMIN_CODE"
    exit 1
fi

# 3. Execute login verification
if [ -x "$APP_DIR/resources/login.sh" ]; then
    "$APP_DIR/resources/login.sh"
fi

echo "All health checks PASSED!"
