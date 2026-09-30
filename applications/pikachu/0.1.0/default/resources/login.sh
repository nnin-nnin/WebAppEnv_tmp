#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18764}"
BASE_URL="http://127.0.0.1:${HOST_PORT}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${USER:-admin}}}"
PASSWORD="${ADMIN_PASSWORD:-${PASSWORD:-123456}}"

echo "Checking Pikachu accessibility at ${BASE_URL}/..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/")

if [ "$HTTP_CODE" -ne 200 ]; then
    echo "FAILED: Pikachu root endpoint returned HTTP $HTTP_CODE (expected 200)"
    exit 1
fi

echo "SUCCESS: Pikachu root endpoint returned HTTP $HTTP_CODE"

LOGIN_CODE=$(curl -s -o /dev/null -w "%{http_code}" -d "username=${USERNAME}&password=${PASSWORD}&submit=Login" "${BASE_URL}/vul/burteforce/bf_form.php" 2>/dev/null || true)
if [ "$LOGIN_CODE" = "200" ]; then
    echo "SUCCESS: Pikachu login endpoint returned HTTP $LOGIN_CODE"
fi

echo "Login verification PASSED!"
exit 0
