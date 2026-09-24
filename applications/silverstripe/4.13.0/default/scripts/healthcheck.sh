#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

HOST_PORT="${HOST_PORT:-18619}"
BASE_URL="http://localhost:${HOST_PORT}"

echo "Checking SilverStripe service health at ${BASE_URL}..."

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)
if [ "$HTTP_CODE" -ge 200 ] && [ "$HTTP_CODE" -lt 400 ]; then
    echo "SUCCESS: SilverStripe root endpoint returned HTTP $HTTP_CODE"
else
    echo "FAILED: SilverStripe root endpoint returned HTTP $HTTP_CODE"
    exit 1
fi

LOGIN_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/Security/login" || true)
if [ "$LOGIN_CODE" -eq 200 ] || [ "$LOGIN_CODE" -eq 301 ] || [ "$LOGIN_CODE" -eq 302 ]; then
    echo "SUCCESS: SilverStripe login endpoint returned HTTP $LOGIN_CODE"
else
    echo "FAILED: SilverStripe login endpoint returned HTTP $LOGIN_CODE"
    exit 1
fi

if [ -x "${APP_DIR}/resources/login.sh" ]; then
    echo "Executing login check..."
    "${APP_DIR}/resources/login.sh"
fi

echo "Health check PASSED!"
