#!/usr/bin/env bash
set -euo pipefail

HOST_PORT="${HOST_PORT:-18623}"
APP_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"

echo "=== Verifying TYPO3 Login and Administration Endpoints at ${APP_URL} ==="

# 1. Verify root endpoint returns 200 or 302
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/")
if [ "$HTTP_CODE" -ne 200 ] && [ "$HTTP_CODE" -ne 302 ]; then
    echo "ERROR: Public root returned HTTP ${HTTP_CODE}, expected 200 or 302"
    exit 1
fi
echo "SUCCESS: Public root returned HTTP ${HTTP_CODE}."

# 2. Verify /typo3/ endpoint (returns 200 or 302)
HTTP_CODE_TYPO3=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/typo3/")
if [ "$HTTP_CODE_TYPO3" -ne 200 ] && [ "$HTTP_CODE_TYPO3" -ne 302 ]; then
    echo "ERROR: /typo3/ endpoint returned HTTP ${HTTP_CODE_TYPO3}, expected 200 or 302"
    exit 1
fi
echo "SUCCESS: /typo3/ endpoint returned HTTP ${HTTP_CODE_TYPO3}."

# 3. Verify final page following redirects returns HTTP 200
HTTP_CODE_FINAL=$(curl -s -L -o /dev/null -w "%{http_code}" "${APP_URL}/typo3/")
if [ "$HTTP_CODE_FINAL" -ne 200 ]; then
    echo "ERROR: TYPO3 login/installer page returned HTTP ${HTTP_CODE_FINAL}, expected 200"
    exit 1
fi
echo "SUCCESS: TYPO3 login/installer page returned HTTP 200."

echo "=== TYPO3 Login Verification PASSED ==="
exit 0
