#!/usr/bin/env bash
set -euo pipefail

HOST_PORT="${HOST_PORT:-18587}"
APP_URL="${APP_URL:-http://localhost:${HOST_PORT}}"
USERNAME="${1:-${B2EVOLUTION_USER:-${ADMIN_USERNAME:-${ADMIN_USER:-${USER:-admin}}}}}"
PASSWORD="${2:-${B2EVOLUTION_PASSWORD:-${ADMIN_PASSWORD:-${ADMIN_USER_PASSWORD:-${PASSWORD:-AdminPassword123!}}}}}"

echo "Testing login endpoint reachability for b2evolution at ${APP_URL} for user '${USERNAME}'..."

LOGIN_URL="${APP_URL}/evoadm.php"
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -L "${LOGIN_URL}" || true)

if [ "${HTTP_CODE}" -ne 200 ]; then
    echo "ERROR: Login endpoint ${LOGIN_URL} returned HTTP ${HTTP_CODE}"
    exit 1
fi

PAGE_CONTENT=$(curl -s -L "${LOGIN_URL}")
if echo "${PAGE_CONTENT}" | grep -qiE "(Log in to your account|login_form|b2evolution)"; then
    echo "SUCCESS: Login endpoint is reachable and returned login form (HTTP ${HTTP_CODE})."
    exit 0
else
    echo "ERROR: Login page content check failed."
    exit 1
fi
