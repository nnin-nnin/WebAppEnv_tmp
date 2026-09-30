#!/usr/bin/env bash
set -eo pipefail

HOST_PORT="${HOST_PORT:-18774}"
BASE_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"

echo "[*] Verifying Apache Shiro Quickstart endpoint at ${BASE_URL}/..."

HTTP_CODE=$(curl --noproxy "*" -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)

if [ "$HTTP_CODE" -ne 200 ]; then
    echo "[-] Root endpoint returned HTTP ${HTTP_CODE} (expected 200)"
    exit 1
fi

RESPONSE=$(curl --noproxy "*" -s "${BASE_URL}/")
if echo "$RESPONSE" | grep -qi "Apache Shiro"; then
    echo "[+] SUCCESS: Shiro web root endpoint returned HTTP 200 with valid content."
    exit 0
else
    echo "[-] FAILED: Response did not contain expected Apache Shiro content"
    exit 1
fi
