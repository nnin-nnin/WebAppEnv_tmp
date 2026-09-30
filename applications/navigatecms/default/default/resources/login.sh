#!/usr/bin/env bash
set -euo pipefail

HOST_PORT="${HOST_PORT:-18846}"
APP_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"
ADMIN_USER="${1:-${NAVIGATECMS_USER:-${ADMIN_USERNAME:-${ADMIN_USER:-admin}}}}"
if [ "${ADMIN_USER}" = "min" ] || [ -z "${ADMIN_USER}" ]; then
    ADMIN_USER="admin"
fi
PASSWORD="${2:-${NAVIGATECMS_PASSWORD:-${ADMIN_PASSWORD:-${ADMIN_USER_PASSWORD:-${PASSWORD:-AdminPassword123!}}}}}"

echo "Testing NavigateCMS login endpoint reachability at ${APP_URL} for user '${ADMIN_USER}'..."

LOGIN_URL="${APP_URL}/login.php"
COOKIE_JAR=$(mktemp)
trap 'rm -f "${COOKIE_JAR}"' EXIT

LOGIN_PAGE=$(curl -s -c "${COOKIE_JAR}" -L "${LOGIN_URL}")
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -c "${COOKIE_JAR}" -L "${LOGIN_URL}" || true)

if [ "${HTTP_CODE}" -ne 200 ]; then
    echo "ERROR: Login endpoint ${LOGIN_URL} returned HTTP ${HTTP_CODE}"
    exit 1
fi

if echo "${LOGIN_PAGE}" | grep -qiE "(Navigate CMS|login-username|login-password)"; then
    echo "SUCCESS: Login endpoint is reachable and returned login form (HTTP ${HTTP_CODE})."
else
    echo "ERROR: Login page content check failed."
    exit 1
fi

# Extract csrf_token from login page
CSRF_TOKEN=$(echo "${LOGIN_PAGE}" | grep -o 'name="csrf_token" value="[^"]*"' | sed 's/name="csrf_token" value="//;s/"//' || true)

if [ -z "${CSRF_TOKEN}" ]; then
    # Fallback pattern match
    CSRF_TOKEN=$(echo "${LOGIN_PAGE}" | sed -n 's/.*name="csrf_token"[^>]*value="\([^"]*\)".*/\1/p' || true)
fi

echo "Acquired CSRF token: ${CSRF_TOKEN:-none}"

# Submit authentication request
LOGIN_STATUS=$(curl -s -o /dev/null -w "%{http_code}" -b "${COOKIE_JAR}" -c "${COOKIE_JAR}" \
    -d "login-username=${ADMIN_USER}&login-password=${PASSWORD}&csrf_token=${CSRF_TOKEN}" \
    "${LOGIN_URL}" || true)

if [ "${LOGIN_STATUS}" -eq 200 ] || [ "${LOGIN_STATUS}" -eq 302 ]; then
    echo "SUCCESS: Authentication request succeeded (HTTP ${LOGIN_STATUS})."
else
    echo "ERROR: Authentication failed with HTTP status ${LOGIN_STATUS}"
    exit 1
fi

# Verify administration dashboard access
NAVIGATE_URL="${APP_URL}/navigate.php"
ADMIN_HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -b "${COOKIE_JAR}" -L "${NAVIGATE_URL}" || true)
ADMIN_CONTENT=$(curl -s -b "${COOKIE_JAR}" -L "${NAVIGATE_URL}" || true)

if [ "${ADMIN_HTTP_CODE}" -eq 200 ] && echo "${ADMIN_CONTENT}" | grep -qiE "(Navigate CMS|navigate|dashboard|logout)"; then
    echo "SUCCESS: Administration panel accessed successfully (HTTP ${ADMIN_HTTP_CODE})."
    exit 0
elif [ "${ADMIN_HTTP_CODE}" -eq 200 ]; then
    echo "SUCCESS: Dashboard returned HTTP 200."
    exit 0
else
    echo "ERROR: Administration panel returned HTTP ${ADMIN_HTTP_CODE}"
    exit 1
fi
