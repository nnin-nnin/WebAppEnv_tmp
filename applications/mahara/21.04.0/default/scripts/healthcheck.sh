#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

HOST_PORT="${HOST_PORT:-18621}"
BASE_URL="http://127.0.0.1:${HOST_PORT}"

echo "Checking Mahara service health at ${BASE_URL}..."

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)
if [ "$HTTP_CODE" -ge 200 ] && [ "$HTTP_CODE" -lt 400 ]; then
    echo "SUCCESS: Mahara root endpoint returned HTTP $HTTP_CODE"
else
    echo "FAILED: Mahara root endpoint returned HTTP $HTTP_CODE"
    exit 1
fi

echo "Health check PASSED!"
