#!/usr/bin/env bash
set -euo pipefail

HOST_PORT="${HOST_PORT:-18879}"
APP_URL="${APP_URL:-http://localhost:${HOST_PORT}}"
ADMIN_USER="${1:-${ZURMO_USER:-${ADMIN_USERNAME:-${ADMIN_USER:-admin}}}}"
PASSWORD="${2:-${ZURMO_PASSWORD:-${ADMIN_PASSWORD:-${ADMIN_USER_PASSWORD:-${PASSWORD:-AdminPassword123!}}}}}"

echo "Testing Zurmo login endpoint reachability at ${APP_URL} for user '${ADMIN_USER}'..."

LOGIN_URL="${APP_URL}/app/index.php/zurmo/default/login"
COOKIE_JAR=$(mktemp)
trap 'rm -f "${COOKIE_JAR}"' EXIT

LOGIN_PAGE=$(curl -s -c "${COOKIE_JAR}" -b "${COOKIE_JAR}" -L "${LOGIN_URL}")
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -c "${COOKIE_JAR}" -b "${COOKIE_JAR}" -L "${LOGIN_URL}" || true)

if [ "${HTTP_CODE}" -ne 200 ]; then
    echo "ERROR: Login endpoint ${LOGIN_URL} returned HTTP ${HTTP_CODE}"
    exit 1
fi

if echo "${LOGIN_PAGE}" | grep -qiE "(LoginForm|zurmo|Sign in)"; then
    echo "SUCCESS: Login endpoint is reachable and returned login form (HTTP ${HTTP_CODE})."
else
    echo "ERROR: Login page content check failed."
    exit 1
fi

# Extract CSRF token from cookie or login page HTML
CSRF_TOKEN=$(grep "YII_CSRF_TOKEN" "${COOKIE_JAR}" | awk '{print $NF}' || true)
if [ -z "${CSRF_TOKEN}" ]; then
    CSRF_TOKEN=$(echo "${LOGIN_PAGE}" | grep -oE 'value="[a-f0-9]{40}"' | head -n 1 | cut -d'"' -f2 || true)
fi

echo "Acquired CSRF token: ${CSRF_TOKEN:-none}"

# Submit authentication request
LOGIN_OUTPUT=$(curl -s -L -b "${COOKIE_JAR}" -c "${COOKIE_JAR}" \
    --data-urlencode "YII_CSRF_TOKEN=${CSRF_TOKEN}" \
    --data-urlencode "LoginForm[username]=${ADMIN_USER}" \
    --data-urlencode "LoginForm[password]=${PASSWORD}" \
    --data-urlencode "LoginForm[rememberMe]=0" \
    --data-urlencode "save=save" \
    "${LOGIN_URL}")

if echo "${LOGIN_OUTPUT}" | grep -qiE "(Sign out|logout|ZurmoCRM - Users|user-header-menu|corp-logo|New Badge)"; then
    echo "SUCCESS: Authentication succeeded and dashboard session established for '${ADMIN_USER}'."
else
    echo "ERROR: Authentication failed or dashboard not reached for '${ADMIN_USER}'."
    echo "${LOGIN_OUTPUT}" | head -n 30
    exit 1
fi

# False-positive verification with invalid credentials
echo "Testing negative authentication (false-positive prevention)..."
BAD_COOKIE=$(mktemp)
curl -s -c "${BAD_COOKIE}" -b "${BAD_COOKIE}" -L "${LOGIN_URL}" > /dev/null
BAD_CSRF=$(grep "YII_CSRF_TOKEN" "${BAD_COOKIE}" | awk '{print $NF}' || true)

BAD_OUTPUT=$(curl -s -L -b "${BAD_COOKIE}" -c "${BAD_COOKIE}" \
    --data-urlencode "YII_CSRF_TOKEN=${BAD_CSRF}" \
    --data-urlencode "LoginForm[username]=${ADMIN_USER}" \
    --data-urlencode "LoginForm[password]=WrongPassword999!" \
    --data-urlencode "LoginForm[rememberMe]=0" \
    --data-urlencode "save=save" \
    "${LOGIN_URL}")
rm -f "${BAD_COOKIE}"

if echo "${BAD_OUTPUT}" | grep -qiE "(Sign out|ZurmoCRM - Users)"; then
    echo "ERROR: False-positive detected! Invalid login was mistakenly accepted."
    exit 1
fi
echo "SUCCESS: Invalid credentials correctly rejected."

echo "All login verifications passed successfully."
exit 0
