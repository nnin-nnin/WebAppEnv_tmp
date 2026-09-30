#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
HOST_PORT="${HOST_PORT:-18673}"
URL="http://127.0.0.1:${HOST_PORT}/rest/v3/health"

echo "Checking Shlink service health at ${URL}..."

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${URL}" 2>/dev/null || true)

if [ "$HTTP_CODE" = "200" ]; then
    echo "SUCCESS: Shlink health endpoint returned HTTP 200!"
else
    echo "FAILED: Shlink health endpoint returned HTTP ${HTTP_CODE}"
    exit 1
fi

if [ -x "${APP_DIR}/resources/login.sh" ]; then
    "${APP_DIR}/resources/login.sh"
fi

echo "Health check PASSED!"
exit 0
