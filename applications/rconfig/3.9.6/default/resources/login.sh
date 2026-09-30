#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18768}"
BASE_URL="${BASE_URL:-http://127.0.0.1:${HOST_PORT}}"
USER="${APP_USER:-${ADMIN_USER:-${ADMIN_USERNAME:-admin}}}"
PASS="${APP_PASSWORD:-${ADMIN_PASSWORD:-${PASSWORD:-admin}}}"

echo "Verifying rConfig entrypoint at ${BASE_URL}/..."

# 1. Entrypoint check
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)
if [ "$HTTP_CODE" -ne 200 ]; then
    echo "FAILED: rConfig root entrypoint returned HTTP ${HTTP_CODE}, expected 200"
    exit 1
fi
echo "SUCCESS: rConfig root entrypoint returned HTTP 200"

# 2. Login page check
LOGIN_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/login.php" || true)
if [ "$LOGIN_CODE" -ne 200 ]; then
    echo "FAILED: rConfig login page returned HTTP ${LOGIN_CODE}, expected 200"
    exit 1
fi
echo "SUCCESS: rConfig login page is accessible (HTTP 200)"

# 3. Authentication check
COOKIE_FILE=$(mktemp)
trap 'rm -f "$COOKIE_FILE"' EXIT

LOGIN_RESP=$(curl -s -i -c "$COOKIE_FILE" -b "$COOKIE_FILE" \
    -X POST \
    -d "user=${USER}&pass=${PASS}&sublogin=1" \
    "${BASE_URL}/lib/crud/userprocess.php")

DASHBOARD_RESP=$(curl -s -c "$COOKIE_FILE" -b "$COOKIE_FILE" "${BASE_URL}/dashboard.php")
if echo "$DASHBOARD_RESP" | grep -qi "Logged in as" || echo "$DASHBOARD_RESP" | grep -qi "${USER}"; then
    echo "SUCCESS: rConfig login verified successfully for user '${USER}'"
    exit 0
fi

echo "FAILED: rConfig login authentication check failed"
exit 1
