#!/usr/bin/env bash
set -euo pipefail

HOST_PORT="${HOST_PORT:-18821}"
URL="http://127.0.0.1:${HOST_PORT}"

echo "Checking elk service health at ${URL}..."

HTTP_CODE=$(curl --noproxy "*" -s -o /dev/null -w "%{http_code}" "$URL/api/status" || true)

if [ "$HTTP_CODE" = "200" ] || [ "$HTTP_CODE" = "302" ]; then
    echo "SUCCESS: Kibana status API returned HTTP $HTTP_CODE!"
    exit 0
fi

HTTP_CODE_APP=$(curl --noproxy "*" -s -o /dev/null -w "%{http_code}" "$URL/app/kibana" || true)
if [ "$HTTP_CODE_APP" = "200" ] || [ "$HTTP_CODE_APP" = "302" ]; then
    echo "SUCCESS: Kibana web app returned HTTP $HTTP_CODE_APP!"
    exit 0
fi

echo "ERROR: Kibana returned unexpected HTTP code (status: $HTTP_CODE, app: $HTTP_CODE_APP)" >&2
exit 1
