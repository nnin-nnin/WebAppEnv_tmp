#!/usr/bin/env bash
set -euo pipefail

HOST_PORT="${HOST_PORT:-18611}"
APP_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"

echo "=== Verifying SPIP Login and Administration Endpoints at ${APP_URL} ==="

# Check public homepage
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/")
if [ "$HTTP_CODE" -ne 200 ]; then
    echo "ERROR: Public homepage returned HTTP ${HTTP_CODE}, expected 200"
    exit 1
fi
echo "SUCCESS: Public homepage returned HTTP 200."

# Check /ecrire/ endpoint (SPIP returns 302 redirecting to login page)
HTTP_CODE_ECRIRE=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/ecrire/")
if [ "$HTTP_CODE_ECRIRE" -ne 200 ] && [ "$HTTP_CODE_ECRIRE" -ne 302 ]; then
    echo "ERROR: /ecrire/ endpoint returned HTTP ${HTTP_CODE_ECRIRE}, expected 200 or 302"
    exit 1
fi
echo "SUCCESS: /ecrire/ endpoint returned HTTP ${HTTP_CODE_ECRIRE}."

# Check login page directly (or following redirect)
HTTP_CODE_LOGIN=$(curl -s -L -o /dev/null -w "%{http_code}" "${APP_URL}/ecrire/")
if [ "$HTTP_CODE_LOGIN" -ne 200 ]; then
    echo "ERROR: Login page returned HTTP ${HTTP_CODE_LOGIN}, expected 200"
    exit 1
fi
echo "SUCCESS: Login page returned HTTP 200."

echo "=== SPIP Login Verification PASSED ==="
exit 0
