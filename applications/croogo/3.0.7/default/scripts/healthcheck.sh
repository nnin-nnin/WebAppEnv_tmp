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

HOST_PORT="${HOST_PORT:-18624}"
BASE_URL="http://localhost:${HOST_PORT}"

echo "Checking Croogo service health at ${BASE_URL}..."

# Verify /admin/users/users/login endpoint
LOGIN_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/admin/users/users/login" || true)
if [ "$LOGIN_CODE" -eq 200 ]; then
    echo "SUCCESS: Croogo login endpoint returned HTTP $LOGIN_CODE"
else
    echo "FAILED: Croogo login endpoint returned HTTP $LOGIN_CODE"
    exit 1
fi

# Verify root endpoint returns 200 or redirect
ROOT_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)
if [ "$ROOT_CODE" -ge 200 ] && [ "$ROOT_CODE" -lt 400 ]; then
    echo "SUCCESS: Croogo root endpoint returned HTTP $ROOT_CODE"
else
    echo "FAILED: Croogo root endpoint returned HTTP $ROOT_CODE"
    exit 1
fi

if [ -x "${APP_DIR}/resources/login.sh" ]; then
    echo "Executing login check..."
    "${APP_DIR}/resources/login.sh"
fi

echo "Health check PASSED!"
