#!/usr/bin/env bash
set -euo pipefail

HOST_PORT="${HOST_PORT:-18596}"
APP_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${1:-${REVIEWBOARD_USER:-${ADMIN_USERNAME:-${ADMIN_USER:-${USER:-admin}}}}}"
PASSWORD="${2:-${REVIEWBOARD_PASSWORD:-${ADMIN_PASSWORD:-${ADMIN_USER_PASSWORD:-${PASSWORD:-AdminPassword123!}}}}}"

echo "Testing login endpoint reachability for Review Board at ${APP_URL} for user '${USERNAME}'..."

LOGIN_URL="${APP_URL}/account/login/"
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -L "${LOGIN_URL}" || true)

if [ "${HTTP_CODE}" -ne 200 ]; then
    echo "ERROR: Login endpoint ${LOGIN_URL} returned HTTP ${HTTP_CODE}"
    exit 1
fi

PAGE_CONTENT=$(curl -s -L "${LOGIN_URL}")
if echo "${PAGE_CONTENT}" | grep -qiE "(Review Board|Log In|login-form|auth-form)"; then
    echo "SUCCESS: Login endpoint is reachable and returned login form (HTTP ${HTTP_CODE})."
    exit 0
else
    echo "ERROR: Login page content check failed."
    exit 1
fi
