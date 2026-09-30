#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18662}"
URL="http://127.0.0.1:${HOST_PORT}/"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USERNAME:-${APP_USER:-admin@example.com}}}}"
PASSWORD="${ADMIN_PASSWORD:-${APP_PASSWORD:-${PASSWORD:-changeme}}}"

echo "Checking nginx-proxy-manager login endpoint at ${URL}..."

HTTP_CODE=$(curl -s -L -o /dev/null -w "%{http_code}" "$URL" || true)

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: nginx-proxy-manager root endpoint returned HTTP 200."
else
    echo "FAILED: nginx-proxy-manager root endpoint returned HTTP ${HTTP_CODE}."
    exit 1
fi

echo "Verifying administrative account access via tokens API..."
TOKEN_RESPONSE=$(curl -s -X POST "http://127.0.0.1:${HOST_PORT}/api/tokens" \
    -H "Content-Type: application/json" \
    -d "{\"identity\":\"${USERNAME}\",\"secret\":\"${PASSWORD}\"}" || true)

if echo "$TOKEN_RESPONSE" | grep -q '"token"'; then
    echo "SUCCESS: Admin account credentials verified via tokens API endpoint."
else
    echo "FAILED: Admin token authentication failed: ${TOKEN_RESPONSE}"
    exit 1
fi

echo "Login check PASSED!"
exit 0
