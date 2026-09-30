#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
HOST_PORT="${HOST_PORT:-18872}"
BASE_URL="${APP_URL:-${BASE_URL:-http://127.0.0.1:${HOST_PORT}}}"

echo "Checking vivo-moonbox service health at ${BASE_URL}..."

API_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/api/app/supportEnv" || echo "000")
if [ "$API_CODE" -ne 200 ]; then
    echo "FAILED: vivo-moonbox /api/app/supportEnv returned HTTP ${API_CODE} (expected 200)"
    exit 1
fi

PAGE_CONTENT=$(curl -s "${BASE_URL}/" || true)
if ! echo "$PAGE_CONTENT" | grep -q "月光宝盒"; then
    echo "FAILED: Root page content does not contain expected title '月光宝盒'"
    exit 1
fi

echo "Health check PASSED!"
