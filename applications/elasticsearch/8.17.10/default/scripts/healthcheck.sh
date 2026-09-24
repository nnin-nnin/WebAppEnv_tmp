#!/usr/bin/env bash
set -eo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18584}"
BASE_URL="${APP_URL:-http://localhost:${HOST_PORT}}"

echo "[*] Checking Elasticsearch service health at ${BASE_URL}/..."
HTTP_CODE=$(curl --noproxy "*" -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "[+] SUCCESS: Elasticsearch root endpoint returned HTTP $HTTP_CODE!"
else
    echo "[-] FAILED: Elasticsearch root endpoint returned HTTP $HTTP_CODE"
    exit 1
fi

HEALTH_STATUS=$(curl --noproxy "*" -s "${BASE_URL}/_cluster/health" 2>/dev/null | grep -o '"status":"[^"]*"' | cut -d'"' -f4 || true)
if [ "$HEALTH_STATUS" = "green" ] || [ "$HEALTH_STATUS" = "yellow" ]; then
    echo "[+] SUCCESS: Elasticsearch cluster health is ${HEALTH_STATUS}!"
else
    echo "[-] FAILED: Elasticsearch cluster health status is '${HEALTH_STATUS}'"
    exit 1
fi

if [ -x "$APP_DIR/resources/login.sh" ]; then
    "$APP_DIR/resources/login.sh"
fi

echo "[+] Health check PASSED!"
