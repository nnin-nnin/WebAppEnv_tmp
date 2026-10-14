#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
HOST_PORT="${HOST_PORT:-18085}"
BASE_URL="${APP_URL:-${BASE_URL:-http://127.0.0.1:${HOST_PORT}}}"

echo "Checking XMall service health at ${BASE_URL}..."

ROOT_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" || echo "000")
if [ "$ROOT_CODE" -ne 200 ] && [ "$ROOT_CODE" -ne 302 ]; then
    echo "FAILED: XMall entrypoint returned HTTP ${ROOT_CODE} (expected 200 or 302)"
    exit 1
fi

if [ -x "${APP_DIR}/resources/login.sh" ]; then
    echo "=== Running Login Verification ==="
    APP_URL="${BASE_URL}" "${APP_DIR}/resources/login.sh"
fi

echo "Health check PASSED!"
