#!/usr/bin/env bash
set -eo pipefail

HOST_PORT="${HOST_PORT:-18770}"
BASE_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"

echo "[*] Verifying Live Helper Chat endpoint at ${BASE_URL}/..."

HTTP_CODE=$(curl --noproxy "*" -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)

if [ "$HTTP_CODE" -eq 200 ] || [ "$HTTP_CODE" -eq 302 ]; then
    echo "[+] SUCCESS: Root endpoint returned valid HTTP code $HTTP_CODE"
else
    echo "[-] FAILED: Root endpoint returned HTTP $HTTP_CODE (expected 200 or 302)"
    exit 1
fi

FOLLOW_CODE=$(curl --noproxy "*" -sL -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)
if [ "$FOLLOW_CODE" -eq 200 ]; then
    echo "[+] SUCCESS: Following redirects returned HTTP $FOLLOW_CODE"
    exit 0
else
    echo "[-] FAILED: Following redirects returned HTTP $FOLLOW_CODE (expected 200)"
    exit 1
fi
