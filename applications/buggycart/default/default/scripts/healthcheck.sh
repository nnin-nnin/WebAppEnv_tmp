#!/usr/bin/env bash
set -eo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18849}"
BASE_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"

echo "[*] Checking buggycart service health at ${BASE_URL}/..."
HTTP_CODE=$(curl --noproxy "*" -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)

if [ "$HTTP_CODE" -eq 200 ] || [ "$HTTP_CODE" -eq 302 ]; then
    echo "[+] SUCCESS: Root endpoint returned HTTP $HTTP_CODE!"
else
    echo "[-] FAILED: Root endpoint returned HTTP $HTTP_CODE (expected 200 or 302)"
    exit 1
fi

FOLLOW_CODE=$(curl --noproxy "*" -sL -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)
if [ "$FOLLOW_CODE" -eq 200 ]; then
    echo "[+] SUCCESS: Following redirect reached application with HTTP $FOLLOW_CODE!"
else
    echo "[-] FAILED: Following redirect returned HTTP $FOLLOW_CODE"
    exit 1
fi

if [ -x "$APP_DIR/resources/login.sh" ]; then
    "$APP_DIR/resources/login.sh"
fi

echo "[+] Health check PASSED!"
