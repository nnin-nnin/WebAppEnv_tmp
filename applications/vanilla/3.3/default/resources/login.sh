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

HOST_PORT="${HOST_PORT:-18603}"
BASE_URL="http://${HOST:-localhost}:${HOST_PORT}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${USER:-admin}}}"
PASSWORD="${ADMIN_PASSWORD:-${PASSWORD:-AdminPassword123!}}"

echo "Checking Vanilla Forums login / availability at ${BASE_URL} for user '${USERNAME}'..."

HTTP_CODE_ROOT=$(curl --noproxy "*" -s -o /dev/null -w "%{http_code}" --max-time 10 "${BASE_URL}/" || true)
HTTP_CODE_SIGNIN=$(curl --noproxy "*" -s -o /dev/null -w "%{http_code}" --max-time 10 "${BASE_URL}/entry/signin" || true)

if [ "$HTTP_CODE_ROOT" -eq 200 ] || [ "$HTTP_CODE_ROOT" -eq 302 ]; then
    echo "SUCCESS: Vanilla Forums web endpoint reachable (HTTP ${HTTP_CODE_ROOT})"
    exit 0
elif [ "$HTTP_CODE_SIGNIN" -eq 200 ] || [ "$HTTP_CODE_SIGNIN" -eq 302 ]; then
    echo "SUCCESS: Vanilla Forums signin endpoint reachable (HTTP ${HTTP_CODE_SIGNIN})"
    exit 0
else
    echo "ERROR: Failed to reach Vanilla Forums endpoint (root=${HTTP_CODE_ROOT}, signin=${HTTP_CODE_SIGNIN})"
    exit 1
fi
