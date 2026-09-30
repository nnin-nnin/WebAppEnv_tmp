#!/usr/bin/env bash
set -eo pipefail

HOST_PORT="${HOST_PORT:-18763}"
BASE_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"

echo "[*] Verifying EmpireCMS endpoints at ${BASE_URL}..."

HTTP_CODE=$(curl --noproxy "*" -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)
if [ "$HTTP_CODE" -ne 200 ]; then
    echo "[-] Root endpoint returned HTTP ${HTTP_CODE} (expected 200)"
    exit 1
fi

APP_HTTP_CODE=$(curl --noproxy "*" -s -o /dev/null -w "%{http_code}" "${BASE_URL}/empirecms/" || true)
if [ "$APP_HTTP_CODE" -ne 200 ]; then
    echo "[-] /empirecms/ endpoint returned HTTP ${APP_HTTP_CODE} (expected 200)"
    exit 1
fi

RESPONSE=$(curl --noproxy "*" -s "${BASE_URL}/empirecms/")
if echo "$RESPONSE" | grep -qi "EmpireCMS"; then
    echo "[+] SUCCESS: EmpireCMS homepage returned HTTP 200 with valid content."
    exit 0
else
    echo "[-] FAILED: Response did not contain expected EmpireCMS content"
    exit 1
fi
