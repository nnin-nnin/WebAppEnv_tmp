#!/usr/bin/env bash
set -euo pipefail

HOST_PORT="${HOST_PORT:-18645}"
URL="http://127.0.0.1:${HOST_PORT}/admin/"

echo "Checking ECShop service health at ${URL}..."
HTTP_CODE=$(curl -s -L -o /dev/null -w "%{http_code}" "$URL" 2>/dev/null || true)

if [ "$HTTP_CODE" = "200" ]; then
    echo "SUCCESS: ECShop returned HTTP $HTTP_CODE"
    exit 0
else
    echo "FAILED: ECShop returned HTTP $HTTP_CODE"
    exit 1
fi
