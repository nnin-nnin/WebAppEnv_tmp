#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${APP_DIR}/docker/compose.yaml"
HOST_PORT="${HOST_PORT:-18654}"
URL="http://127.0.0.1:${HOST_PORT}/admin/"

echo "Checking YOURLS service health at ${URL}..."

# Ensure install completed
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${URL}" 2>/dev/null || true)
if [ "$HTTP_CODE" = "302" ] || [ "$HTTP_CODE" = "307" ]; then
    echo "Running install.php..."
    curl -s -L "http://127.0.0.1:${HOST_PORT}/admin/install.php?install=1" > /dev/null 2>&1 || true
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${URL}" 2>/dev/null || true)
fi

if [ "$HTTP_CODE" = "200" ]; then
    echo "SUCCESS: YOURLS admin endpoint returned HTTP 200!"
else
    echo "FAILED: YOURLS admin endpoint returned HTTP ${HTTP_CODE}"
    exit 1
fi

if [ -x "${APP_DIR}/resources/login.sh" ]; then
    "${APP_DIR}/resources/login.sh"
fi

echo "Health check PASSED!"
exit 0
