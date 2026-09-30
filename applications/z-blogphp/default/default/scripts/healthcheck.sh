#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
HOST_PORT="${HOST_PORT:-18878}"
BASE_URL="${APP_URL:-${BASE_URL:-http://127.0.0.1:${HOST_PORT}}}"

echo "Checking Z-BlogPHP service health at ${BASE_URL}..."

LOGIN_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/zb_system/login.php" || echo "000")
if [ "$LOGIN_CODE" -ne 200 ] && [ "$LOGIN_CODE" -ne 302 ]; then
    echo "FAILED: Z-BlogPHP login.php returned HTTP ${LOGIN_CODE} (expected 200 or 302)"
    exit 1
fi

PAGE_CONTENT=$(curl -s "${BASE_URL}/zb_system/login.php" || true)
if ! echo "$PAGE_CONTENT" | grep -qiE "(Z-BlogPHP|csrfToken)"; then
    echo "FAILED: Page content does not match Z-BlogPHP"
    exit 1
fi

if [ -x "${APP_DIR}/resources/login.sh" ]; then
    echo "=== Running Login Verification ==="
    APP_URL="${BASE_URL}" "${APP_DIR}/resources/login.sh"
fi

echo "Health check PASSED!"
