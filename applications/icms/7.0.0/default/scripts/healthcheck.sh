#!/usr/bin/env bash
set -euo pipefail

# Strip local proxies
export http_proxy=""
export https_proxy=""
export HTTP_PROXY=""
export HTTPS_PROXY=""
export all_proxy=""
export ALL_PROXY=""
export no_proxy="*"
export NO_PROXY="*"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

HOST_PORT="${HOST_PORT:-18633}"
BASE_URL="http://127.0.0.1:${HOST_PORT}"

echo "Checking iCMS service health at ${BASE_URL}..."

# Verify /admincp.php endpoint
LOGIN_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/admincp.php" || true)
if [ "$LOGIN_CODE" -eq 200 ]; then
    echo "SUCCESS: iCMS /admincp.php endpoint returned HTTP $LOGIN_CODE"
else
    echo "FAILED: iCMS /admincp.php endpoint returned HTTP $LOGIN_CODE"
    exit 1
fi

# Verify root endpoint returns 200
ROOT_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)
if [ "$ROOT_CODE" -eq 200 ]; then
    echo "SUCCESS: iCMS root endpoint returned HTTP $ROOT_CODE"
else
    echo "FAILED: iCMS root endpoint returned HTTP $ROOT_CODE"
    exit 1
fi

if [ -x "${APP_DIR}/resources/login.sh" ]; then
    echo "Executing login check..."
    "${APP_DIR}/resources/login.sh"
fi

echo "Health check PASSED!"
