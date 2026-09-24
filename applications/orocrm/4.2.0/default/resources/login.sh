#!/usr/bin/env bash
set -euo pipefail

HOST_PORT="${HOST_PORT:-18627}"
BASE_URL="${BASE_URL:-http://127.0.0.1:${HOST_PORT}}"

echo "Verifying OroCRM login endpoint at ${BASE_URL}..."

# Verify /user/login endpoint response (200 or 302 redirect)
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/user/login" 2>/dev/null || true)

if [ "$HTTP_CODE" = "200" ] || [ "$HTTP_CODE" = "302" ]; then
    echo "SUCCESS: OroCRM /user/login endpoint returned HTTP ${HTTP_CODE}"
    exit 0
fi

# Fallback check root HTTP 200
HTTP_CODE_ROOT=$(curl -s -L -o /dev/null -w "%{http_code}" "${BASE_URL}/" 2>/dev/null || true)
if [ "$HTTP_CODE_ROOT" = "200" ]; then
    echo "SUCCESS: OroCRM web service returned HTTP ${HTTP_CODE_ROOT}"
    exit 0
fi

echo "FAILED: OroCRM login check failed (status: ${HTTP_CODE})"
exit 1
