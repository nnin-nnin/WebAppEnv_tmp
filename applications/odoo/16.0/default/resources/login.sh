#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18612}"
BASE_URL="${BASE_URL:-http://localhost:${HOST_PORT}}"

echo "Checking Odoo login / web endpoint at ${BASE_URL}..."

# Check /web/login endpoint with redirect follow (-L)
HTTP_CODE=$(curl -s -L -o /dev/null -w "%{http_code}" "${BASE_URL}/web/login" || true)

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: Odoo /web/login endpoint reachable (HTTP $HTTP_CODE)"
    exit 0
fi

# Fallback check root endpoint
ROOT_CODE=$(curl -s -L -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)
if [ "$ROOT_CODE" -eq 200 ]; then
    echo "SUCCESS: Odoo web endpoint reachable (HTTP $ROOT_CODE)"
    exit 0
fi

echo "FAILED: Odoo login endpoint check failed (HTTP ${HTTP_CODE}, root: ${ROOT_CODE})"
exit 1
