#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18566}"
URL="http://127.0.0.1:${HOST_PORT}/web/index.php/auth/login"

echo "Checking OrangeHRM service health at $URL..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$URL" 2>/dev/null || true)

if [ "$HTTP_CODE" = "200" ] || [ "$HTTP_CODE" = "302" ]; then
    echo "SUCCESS: OrangeHRM returned HTTP $HTTP_CODE!"
    exit 0
else
    echo "FAILED: OrangeHRM returned HTTP $HTTP_CODE"
    exit 1
fi
