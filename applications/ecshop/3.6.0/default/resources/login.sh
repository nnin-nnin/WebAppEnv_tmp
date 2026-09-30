#!/usr/bin/env bash
set -euo pipefail

HOST_PORT="${HOST_PORT:-18645}"
BASE_URL="${BASE_URL:-http://127.0.0.1:${HOST_PORT}}"

echo "Checking ECShop admin login endpoint at ${BASE_URL}/admin/..."

HTTP_CODE=$(curl -s -L -o /dev/null -w "%{http_code}" "${BASE_URL}/admin/")

if [ "$HTTP_CODE" = "200" ]; then
    echo "SUCCESS: ECShop admin login endpoint returned HTTP 200"
    exit 0
else
    echo "FAILED: ECShop admin endpoint returned HTTP ${HTTP_CODE}, expected 200"
    exit 1
fi
