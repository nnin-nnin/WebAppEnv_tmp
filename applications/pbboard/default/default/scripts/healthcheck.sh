#!/usr/bin/env bash
set -euo pipefail

HOST_PORT="${HOST_PORT:-18852}"
URL="http://127.0.0.1:${HOST_PORT}"

echo "Checking pbboard service health at ${URL}..."

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$URL/" || true)

if [ "$HTTP_CODE" = "200" ] || [ "$HTTP_CODE" = "301" ] || [ "$HTTP_CODE" = "302" ]; then
    echo "SUCCESS: pbboard returned HTTP $HTTP_CODE!"
    exit 0
else
    echo "ERROR: pbboard returned unexpected HTTP $HTTP_CODE (expected 200/301/302)" >&2
    exit 1
fi
