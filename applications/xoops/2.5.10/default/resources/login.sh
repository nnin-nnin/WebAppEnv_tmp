#!/usr/bin/env bash
set -euo pipefail

HOST_PORT="${HOST_PORT:-18602}"
APP_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${1:-${XOOPS_USER:-${ADMIN_USERNAME:-${ADMIN_USER:-${USER:-admin}}}}}"
PASSWORD="${2:-${XOOPS_PASSWORD:-${ADMIN_PASSWORD:-${ADMIN_USER_PASSWORD:-${PASSWORD:-AdminPassword123!}}}}}"

echo "Testing XOOPS login endpoint reachability at ${APP_URL} for user '${USERNAME}'..."

LOGIN_URL="${APP_URL}/user.php"
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -L "${LOGIN_URL}" || true)

if [ "${HTTP_CODE}" -ne 200 ]; then
    echo "ERROR: Login endpoint ${LOGIN_URL} returned HTTP ${HTTP_CODE}"
    exit 1
fi

PAGE_CONTENT=$(curl -s -L "${LOGIN_URL}")
if echo "${PAGE_CONTENT}" | grep -qiE "(User Login|loginform|xoops_redirect)"; then
    echo "SUCCESS: Login endpoint is reachable and returned login form (HTTP ${HTTP_CODE})."
else
    echo "ERROR: Login page content check failed."
    exit 1
fi

COOKIE_JAR=$(mktemp)
trap 'rm -f "${COOKIE_JAR}"' EXIT

LOGIN_STATUS=$(curl -s -o /dev/null -w "%{http_code}" -c "${COOKIE_JAR}" \
    -d "uname=${USERNAME}&pass=${PASSWORD}&op=login&xoops_redirect=%2F" \
    "${LOGIN_URL}" || true)

if [ "${LOGIN_STATUS}" -eq 200 ] || [ "${LOGIN_STATUS}" -eq 302 ]; then
    echo "SUCCESS: Authentication request succeeded (HTTP ${LOGIN_STATUS})."
    exit 0
else
    echo "ERROR: Authentication failed with HTTP status ${LOGIN_STATUS}"
    exit 1
fi
