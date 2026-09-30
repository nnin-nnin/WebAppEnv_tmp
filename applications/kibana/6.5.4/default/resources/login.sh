#!/usr/bin/env bash
set -euo pipefail

HOST_PORT="${HOST_PORT:-18649}"
BASE_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"
LOGIN_URL="${BASE_URL}/app/kibana"

echo "[*] Checking Kibana web application at ${LOGIN_URL}..."

MAX_RETRIES=15
RETRY_COUNT=0

while [ $RETRY_COUNT -lt $MAX_RETRIES ]; do
    HTTP_CODE=$(curl --noproxy "*" -s -o /dev/null -w "%{http_code}" "${LOGIN_URL}" || true)
    if [ "$HTTP_CODE" -eq 200 ]; then
        echo "[+] SUCCESS: Kibana returned HTTP ${HTTP_CODE} at ${LOGIN_URL}."
        exit 0
    fi
    RETRY_COUNT=$((RETRY_COUNT + 1))
    echo "[*] Waiting for Kibana app endpoint... (attempt $RETRY_COUNT/$MAX_RETRIES, code: $HTTP_CODE)"
    sleep 2
done

echo "[-] FAILED: Kibana endpoint ${LOGIN_URL} did not return HTTP 200 (last code: $HTTP_CODE)."
exit 1
