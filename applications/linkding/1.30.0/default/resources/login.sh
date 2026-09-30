#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18694}"
BASE_URL="${BASE_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${1:-${LINKDING_USER:-${LINKDING_USERNAME:-${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-admin}}}}}}"
PASSWORD="${2:-${LINKDING_PASSWORD:-${ADMIN_PASSWORD:-${APP_PASSWORD:-${PASSWORD:-Admin123456!}}}}}"

echo "Testing linkding access and authentication at ${BASE_URL}..."

# Step 1: Detect http://127.0.0.1:18694/login returns 200 (following redirect)
LOGIN_URL="${BASE_URL}/login"
HTTP_CODE=$(curl -s -L -o /dev/null -w "%{http_code}" "${LOGIN_URL}" || true)
if [ "${HTTP_CODE}" -ne 200 ]; then
    echo "FAILED: ${LOGIN_URL} did not return HTTP 200 (got HTTP ${HTTP_CODE})"
    exit 1
fi
echo "SUCCESS: ${LOGIN_URL} returned HTTP 200"

# Step 2: Extract CSRF token from login page
COOKIE_JAR=$(mktemp)
trap 'rm -f "$COOKIE_JAR"' EXIT

LOGIN_PAGE=$(curl -s -L -c "${COOKIE_JAR}" "${BASE_URL}/login/")
CSRF_TOKEN=$(echo "${LOGIN_PAGE}" | grep -o 'name="csrfmiddlewaretoken" value="[^"]*"' | head -n 1 | cut -d'"' -f4)

if [ -z "${CSRF_TOKEN}" ]; then
    echo "FAILED: Could not extract CSRF token from login page"
    exit 1
fi

# Step 3: Perform login POST request
LOGIN_RESP=$(curl -s -L -b "${COOKIE_JAR}" -c "${COOKIE_JAR}" \
    -H "Referer: ${BASE_URL}/login/" \
    -d "csrfmiddlewaretoken=${CSRF_TOKEN}" \
    -d "username=${USERNAME}" \
    -d "password=${PASSWORD}" \
    "${BASE_URL}/login/")

# Step 4: Verify authentication
if echo "${LOGIN_RESP}" | grep -qiE "(Log out|logout|Bookmarks|Settings|Admin)"; then
    echo "SUCCESS: User '${USERNAME}' successfully authenticated into linkding"
    exit 0
fi

echo "FAILED: linkding authentication check failed"
exit 1
