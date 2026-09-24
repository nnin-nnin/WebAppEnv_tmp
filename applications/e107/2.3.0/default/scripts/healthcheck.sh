#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

HOST_PORT="${HOST_PORT:-18604}"
BASE_URL="http://localhost:${HOST_PORT}"

echo "Checking e107 service health at ${BASE_URL}..."

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)
if [ "$HTTP_CODE" -ge 200 ] && [ "$HTTP_CODE" -lt 400 ]; then
    echo "SUCCESS: e107 root endpoint returned HTTP $HTTP_CODE"
else
    echo "FAILED: e107 root endpoint returned HTTP $HTTP_CODE"
    exit 1
fi

ADMIN_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/e107_admin/" || true)
if [ "$ADMIN_CODE" -eq 200 ] || [ "$ADMIN_CODE" -eq 301 ] || [ "$ADMIN_CODE" -eq 302 ]; then
    echo "SUCCESS: e107 admin endpoint returned HTTP $ADMIN_CODE"
else
    echo "FAILED: e107 admin endpoint returned HTTP $ADMIN_CODE"
    exit 1
fi

if [ -x "${APP_DIR}/resources/login.sh" ]; then
    echo "Executing login check..."
    "${APP_DIR}/resources/login.sh"
fi

echo "Health check PASSED!"
