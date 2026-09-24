#!/usr/bin/env bash
set -euo pipefail

HOST_PORT="${HOST_PORT:-18627}"
URL="http://127.0.0.1:${HOST_PORT}"

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${URL}/" 2>/dev/null || true)

if [ "$HTTP_CODE" = "200" ] || [ "$HTTP_CODE" = "302" ]; then
    echo "SUCCESS: OroCRM root returned HTTP $HTTP_CODE"
    exit 0
else
    echo "FAILED: OroCRM root returned HTTP $HTTP_CODE"
    exit 1
fi
