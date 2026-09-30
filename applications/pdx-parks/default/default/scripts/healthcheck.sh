#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
HOST_PORT="${HOST_PORT:-18853}"
BASE_URL="${APP_URL:-${BASE_URL:-http://127.0.0.1:${HOST_PORT}}}"

echo "Checking pdx-parks service health at ${BASE_URL}..."

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/health" || echo "000")
if [ "$HTTP_CODE" -ne 200 ]; then
    echo "FAILED: pdx-parks health endpoint returned HTTP ${HTTP_CODE} (expected 200)"
    exit 1
fi

PAGE_CONTENT=$(curl -s "${BASE_URL}/" || true)
if ! echo "$PAGE_CONTENT" | grep -qi "PDX Parks"; then
    echo "FAILED: Page content does not match PDX Parks"
    exit 1
fi

echo "Health check PASSED!"
