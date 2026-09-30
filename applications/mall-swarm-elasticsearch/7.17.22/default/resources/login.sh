#!/usr/bin/env bash
set -eo pipefail

HOST_PORT="${HOST_PORT:-18756}"
BASE_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"

echo "[*] Verifying Elasticsearch root endpoint at ${BASE_URL}/..."

HTTP_CODE=$(curl --noproxy "*" -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)

if [ "$HTTP_CODE" -ne 200 ]; then
    echo "[-] Root endpoint returned HTTP ${HTTP_CODE} (expected 200)"
    exit 1
fi

RESPONSE=$(curl --noproxy "*" -s "${BASE_URL}/")
if echo "$RESPONSE" | grep -q "You Know, for Search" && echo "$RESPONSE" | grep -q "cluster_name"; then
    echo "[+] SUCCESS: Elasticsearch root status endpoint returned HTTP 200 with valid cluster status."
    exit 0
else
    echo "[-] FAILED: Response did not contain expected cluster status:"
    echo "$RESPONSE"
    exit 1
fi
