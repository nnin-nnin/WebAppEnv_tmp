#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
HOST_PORT="${HOST_PORT:-18083}"
BASE_URL="${APP_URL:-${BASE_URL:-http://127.0.0.1:${HOST_PORT}}}"

echo "Checking webchess service health at ${BASE_URL}..."

HEALTH_RESP=$(curl -s "${BASE_URL}/health.php" || echo "")
if ! echo "$HEALTH_RESP" | grep -q '"status":"UP"'; then
    echo "FAILED: webchess health.php returned unexpected response: ${HEALTH_RESP}"
    exit 1
fi

PAGE_CONTENT=$(curl -s -L "${BASE_URL}/" || true)
if ! echo "$PAGE_CONTENT" | grep -qiE "(PHP7-Webchess|Webchess|Login|Main Menu)"; then
    echo "FAILED: Root page content does not match PHP7-Webchess"
    exit 1
fi

echo "Health check PASSED! Webchess is fully operational on port ${HOST_PORT}."
exit 0
