#!/usr/bin/env bash
set -eo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18830}"
BASE_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"

echo "[*] Checking Hostel Management System health at ${BASE_URL}/..."
HTTP_CODE=$(curl --noproxy "*" -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)

if [ "$HTTP_CODE" -eq 200 ] || [ "$HTTP_CODE" -eq 302 ]; then
    echo "[+] SUCCESS: Root endpoint returned HTTP $HTTP_CODE!"
else
    echo "[-] FAILED: Root endpoint returned HTTP $HTTP_CODE (expected 200 or 302)"
    exit 1
fi

LOGIN_PAGE_CODE=$(curl --noproxy "*" -s -o /dev/null -w "%{http_code}" "${BASE_URL}/login-hostel_manager.php" || true)
if [ "$LOGIN_PAGE_CODE" -eq 200 ]; then
    echo "[+] SUCCESS: Manager/Admin login page returned HTTP $LOGIN_PAGE_CODE!"
else
    echo "[-] FAILED: Manager/Admin login page returned HTTP $LOGIN_PAGE_CODE"
    exit 1
fi

if [ -x "$APP_DIR/resources/login.sh" ]; then
    "$APP_DIR/resources/login.sh"
fi

echo "[+] Health check PASSED!"
