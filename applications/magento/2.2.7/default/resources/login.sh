#!/usr/bin/env bash
set -euo pipefail

HOST_PORT="${HOST_PORT:-18636}"
BASE_URL="${BASE_URL:-http://127.0.0.1:${HOST_PORT}}"

echo "Testing Magento login/admin endpoints at ${BASE_URL}..."

# Check /admin/ endpoint with follow redirects
ADMIN_CODE=$(curl -s -o /dev/null -w "%{http_code}" -L -H "User-Agent: Mozilla/5.0" "${BASE_URL}/admin/" 2>/dev/null || true)
echo "Admin endpoint (${BASE_URL}/admin/) returned HTTP ${ADMIN_CODE}"

# Check /setup/ endpoint
SETUP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -H "User-Agent: Mozilla/5.0" "${BASE_URL}/setup/" 2>/dev/null || true)
echo "Setup endpoint (${BASE_URL}/setup/) returned HTTP ${SETUP_CODE}"

# Check root endpoint
ROOT_CODE=$(curl -s -o /dev/null -w "%{http_code}" -L -H "User-Agent: Mozilla/5.0" "${BASE_URL}/" 2>/dev/null || true)
echo "Root endpoint (${BASE_URL}/) returned HTTP ${ROOT_CODE}"

if [ "${ADMIN_CODE}" = "200" ] || [ "${SETUP_CODE}" = "200" ] || [ "${ROOT_CODE}" = "200" ]; then
    echo "SUCCESS: Magento login/admin endpoint verification passed!"
    exit 0
else
    echo "FAILED: Expected HTTP 200 on Magento endpoints, got admin=${ADMIN_CODE}, setup=${SETUP_CODE}, root=${ROOT_CODE}"
    exit 1
fi
