#!/usr/bin/env bash
set -euo pipefail

HOST_PORT="${HOST_PORT:-18839}"
URL="http://127.0.0.1:${HOST_PORT}"

echo "Checking lodel service health at ${URL}..."

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$URL/" || true)

if [ "$HTTP_CODE" = "200" ] || [ "$HTTP_CODE" = "301" ] || [ "$HTTP_CODE" = "302" ]; then
    echo "SUCCESS: lodel root returned HTTP $HTTP_CODE!"
else
    echo "ERROR: lodel returned unexpected HTTP $HTTP_CODE (expected 200/301/302)" >&2
    exit 1
fi

HTTP_ADMIN_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$URL/lodeladmin/login.php" || true)
if [ "$HTTP_ADMIN_CODE" = "200" ] || [ "$HTTP_ADMIN_CODE" = "302" ]; then
    echo "SUCCESS: lodel admin login page returned HTTP $HTTP_ADMIN_CODE!"
else
    echo "ERROR: lodel admin login returned unexpected HTTP $HTTP_ADMIN_CODE" >&2
    exit 1
fi

echo "=== lodel Health Check PASSED ==="
exit 0
