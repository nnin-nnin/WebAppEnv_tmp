#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18757}"
BASE_URL="http://127.0.0.1:${HOST_PORT}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${USER:-admin@admin.com}}}"
PASSWORD="${ADMIN_PASSWORD:-${PASSWORD:-password}}"

echo "Checking AsgardCMS root endpoint at ${BASE_URL}/..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/")

if [ "$HTTP_CODE" -ne 200 ]; then
    echo "FAILED: AsgardCMS root endpoint returned HTTP $HTTP_CODE (expected 200)"
    exit 1
fi

echo "SUCCESS: AsgardCMS root endpoint returned HTTP $HTTP_CODE"

echo "Verifying AsgardCMS login authentication..."
LOGIN_CODE=$(curl -s -o /dev/null -w "%{http_code}" -X POST \
    -d "username=${USERNAME}&password=${PASSWORD}" \
    "${BASE_URL}/?action=login")

if [ "$LOGIN_CODE" -eq 200 ] || [ "$LOGIN_CODE" -eq 302 ]; then
    echo "SUCCESS: Login endpoint returned HTTP $LOGIN_CODE"
else
    echo "FAILED: Login endpoint returned HTTP $LOGIN_CODE"
    exit 1
fi

echo "Login verification PASSED!"
exit 0
