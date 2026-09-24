#!/usr/bin/env bash
set -e

# Strip local proxies
export http_proxy=""
export https_proxy=""
export HTTP_PROXY=""
export HTTPS_PROXY=""
export all_proxy=""
export ALL_PROXY=""
export no_proxy="*"
export NO_PROXY="*"

HOST_PORT="${HOST_PORT:-18632}"
BASE_URL="${BASE_URL:-http://localhost:${HOST_PORT}}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-admin}}}"
PASSWORD="${ADMIN_PASSWORD:-${ADMIN_PASS:-${APP_PASSWORD:-AdminPassword123!}}}"

echo "Testing Coppermine endpoint at ${BASE_URL}..."

# Check /login.php endpoint
LOGIN_URL="${BASE_URL}/login.php"
HTTP_CODE_LOGIN=$(curl -s -o /dev/null -w "%{http_code}" -H "User-Agent: Mozilla/5.0" "${LOGIN_URL}" 2>/dev/null || true)
echo "Login endpoint (${LOGIN_URL}) returned HTTP ${HTTP_CODE_LOGIN}"

# Check root endpoint
INDEX_URL="${BASE_URL}/"
HTTP_CODE_INDEX=$(curl -s -o /dev/null -w "%{http_code}" -H "User-Agent: Mozilla/5.0" "${INDEX_URL}" 2>/dev/null || true)
echo "Root endpoint (${INDEX_URL}) returned HTTP ${HTTP_CODE_INDEX}"

if [ "${HTTP_CODE_LOGIN}" = "200" ]; then
    echo "SUCCESS: Coppermine /login.php returned HTTP 200!"
    exit 0
elif [ "${HTTP_CODE_INDEX}" = "200" ] || ([ "${HTTP_CODE_INDEX}" -ge 200 ] && [ "${HTTP_CODE_INDEX}" -lt 400 ]); then
    echo "SUCCESS: Coppermine HTTP status ${HTTP_CODE_INDEX} verified!"
    exit 0
else
    echo "FAILED: Coppermine endpoint check failed (login=${HTTP_CODE_LOGIN}, index=${HTTP_CODE_INDEX})"
    exit 1
fi
