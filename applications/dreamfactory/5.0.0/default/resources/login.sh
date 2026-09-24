#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18597}"
BASE_URL="http://127.0.0.1:${HOST_PORT}"

echo "Checking DreamFactory login / availability at ${BASE_URL}..."

# Check web UI and API endpoints
HTTP_CODE_DIST=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/dreamfactory/dist/index.html" || true)
HTTP_CODE_ENV=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/api/v2/system/environment" || true)
HTTP_CODE_ROOT=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)

if [ "$HTTP_CODE_DIST" -eq 200 ]; then
    echo "SUCCESS: DreamFactory web interface reachable (HTTP $HTTP_CODE_DIST)"
    exit 0
elif [ "$HTTP_CODE_ENV" -eq 200 ]; then
    echo "SUCCESS: DreamFactory environment API reachable (HTTP $HTTP_CODE_ENV)"
    exit 0
elif [ "$HTTP_CODE_ROOT" -eq 200 ] || [ "$HTTP_CODE_ROOT" -eq 302 ]; then
    echo "SUCCESS: DreamFactory root endpoint reachable (HTTP $HTTP_CODE_ROOT)"
    exit 0
else
    echo "FAILED: DreamFactory endpoints not responding as expected (dist=$HTTP_CODE_DIST, env=$HTTP_CODE_ENV, root=$HTTP_CODE_ROOT)"
    exit 1
fi
