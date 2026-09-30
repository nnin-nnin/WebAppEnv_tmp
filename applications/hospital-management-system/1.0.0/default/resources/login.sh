#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18765}"
BASE_URL="http://${HOST:-127.0.0.1}:${HOST_PORT}"
USERNAME="${1:-${HMS_USER:-${HMS_USERNAME:-${ADMIN_USERNAME:-${ADMIN_USER:-admin}}}}}"
PASSWORD="${2:-${HMS_PASSWORD:-${ADMIN_PASSWORD:-admin}}}"

echo "Testing hospital-management-system access at ${BASE_URL}..."

# Step 1: Detect root endpoint returns HTTP 200
HTTP_CODE_ROOT=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)
if [ "${HTTP_CODE_ROOT}" -ne 200 ]; then
    echo "FAILED: ${BASE_URL}/ did not return HTTP 200 (got HTTP ${HTTP_CODE_ROOT})"
    exit 1
fi
echo "SUCCESS: ${BASE_URL}/ returned HTTP 200"

# Step 2: Check adminlogin.php returns HTTP 200
LOGIN_URL="${BASE_URL}/adminlogin.php"
HTTP_CODE_LOGIN=$(curl -s -o /dev/null -w "%{http_code}" "${LOGIN_URL}" || true)
if [ "${HTTP_CODE_LOGIN}" -ne 200 ]; then
    echo "FAILED: ${LOGIN_URL} did not return HTTP 200 (got HTTP ${HTTP_CODE_LOGIN})"
    exit 1
fi
echo "SUCCESS: ${LOGIN_URL} returned HTTP 200"

# Step 3: Authenticate admin user
COOKIE_JAR=$(mktemp)
trap 'rm -f "$COOKIE_JAR"' EXIT

RESP=$(curl -s -b "$COOKIE_JAR" -c "$COOKIE_JAR" \
    -d "loginid=${USERNAME}&password=${PASSWORD}&submit=Login" \
    "${LOGIN_URL}" || true)

if echo "$RESP" | grep -qi "adminaccount.php"; then
    echo "SUCCESS: Admin user '${USERNAME}' authenticated successfully."
    exit 0
else
    # Fallback check with default initial password if applicable
    RESP2=$(curl -s -b "$COOKIE_JAR" -c "$COOKIE_JAR" \
        -d "loginid=${USERNAME}&password=123456789&submit=Login" \
        "${LOGIN_URL}" || true)
    if echo "$RESP2" | grep -qi "adminaccount.php"; then
        echo "SUCCESS: Admin user '${USERNAME}' authenticated successfully with default password."
        exit 0
    fi
    echo "FAILED: Authentication failed for user '${USERNAME}'"
    exit 1
fi
