#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18552}"
URL="http://localhost:${HOST_PORT}/login.php"

echo "Checking Seo Panel service health at $URL..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$URL" 2>/dev/null || true)

if [ "$HTTP_CODE" -ge 200 ] && [ "$HTTP_CODE" -lt 400 ]; then
    echo "SUCCESS: Seo Panel returned HTTP $HTTP_CODE!"
    exit 0
else
    echo "FAILED: Seo Panel returned HTTP $HTTP_CODE"
    exit 1
fi
