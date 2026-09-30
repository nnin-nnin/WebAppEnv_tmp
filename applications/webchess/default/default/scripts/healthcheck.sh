#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
HOST_PORT="${HOST_PORT:-18874}"
BASE_URL="${APP_URL:-${BASE_URL:-http://127.0.0.1:${HOST_PORT}}}"

echo "Checking webchess service health at ${BASE_URL}..."

HEALTH_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/health.php" || echo "000")
if [ "$HEALTH_CODE" -ne 200 ]; then
    echo "FAILED: webchess health.php returned HTTP ${HEALTH_CODE} (expected 200)"
    exit 1
fi

PAGE_CONTENT=$(curl -s "${BASE_URL}/" || true)
if ! echo "$PAGE_CONTENT" | grep -qiE "(PHP7-Webchess|Webchess|Login)"; then
    echo "FAILED: Root page content does not match PHP7-Webchess"
    exit 1
fi

echo "Health check PASSED!"
