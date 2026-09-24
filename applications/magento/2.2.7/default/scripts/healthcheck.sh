#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18636}"

URL="http://127.0.0.1:${HOST_PORT}/"
echo "Checking Magento service health at $URL..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -L -H "User-Agent: Mozilla/5.0" "$URL" 2>/dev/null || true)

if [ "$HTTP_CODE" = "200" ] || [ "$HTTP_CODE" = "302" ]; then
    echo "SUCCESS: Magento returned HTTP ${HTTP_CODE} on ${URL}"
    exit 0
else
    echo "FAILED: Magento returned HTTP ${HTTP_CODE} on ${URL}"
    exit 1
fi
