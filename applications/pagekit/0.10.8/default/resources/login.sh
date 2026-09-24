#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18591}"
BASE_URL="http://127.0.0.1:${HOST_PORT}"

echo "Checking Pagekit login / status at ${BASE_URL}..."

# Check installer endpoint
HTTP_CODE_INSTALLER=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/installer" || true)
HTTP_CODE_ROOT=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)
HTTP_CODE_ADMIN=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/admin" || true)

if [ "$HTTP_CODE_INSTALLER" -eq 200 ]; then
    echo "SUCCESS: Pagekit installer endpoint reachable (HTTP $HTTP_CODE_INSTALLER)"
    exit 0
elif [ "$HTTP_CODE_ROOT" -eq 200 ] || [ "$HTTP_CODE_ROOT" -eq 302 ]; then
    echo "SUCCESS: Pagekit root endpoint reachable (HTTP $HTTP_CODE_ROOT)"
    exit 0
elif [ "$HTTP_CODE_ADMIN" -eq 200 ] || [ "$HTTP_CODE_ADMIN" -eq 302 ]; then
    echo "SUCCESS: Pagekit admin endpoint reachable (HTTP $HTTP_CODE_ADMIN)"
    exit 0
else
    echo "FAILED: Pagekit endpoints not responding as expected (installer=$HTTP_CODE_INSTALLER, root=$HTTP_CODE_ROOT, admin=$HTTP_CODE_ADMIN)"
    exit 1
fi
