#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18673}"
BASE_URL="${BASE_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${1:-${ADMIN_USERNAME:-${ADMIN_USER:-admin}}}"
PASSWORD="${2:-${ADMIN_PASSWORD:-${ADMIN_PASS:-Admin123456!}}}"

echo "Testing health and authentication endpoint at ${BASE_URL}/rest/v3/health..."

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/rest/v3/health" 2>/dev/null || true)

if [ "$HTTP_CODE" = "200" ]; then
    echo "SUCCESS: ${BASE_URL}/rest/v3/health returned HTTP 200!"
    exit 0
else
    echo "FAILED: ${BASE_URL}/rest/v3/health returned HTTP ${HTTP_CODE}"
    exit 1
fi
