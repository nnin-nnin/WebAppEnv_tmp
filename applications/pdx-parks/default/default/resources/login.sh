#!/usr/bin/env bash
set -euo pipefail

HOST_PORT="${HOST_PORT:-18853}"
BASE_URL="${APP_URL:-${BASE_URL:-http://127.0.0.1:${HOST_PORT}}}"
USERNAME="${1:-${ADMIN_USERNAME:-admin}}"
PASSWORD="${2:-${ADMIN_PASSWORD:-AdminPassword123!}}"

COOKIE_JAR="$(mktemp)"
LOGIN_RES="$(mktemp)"
trap 'rm -f "$COOKIE_JAR" "$LOGIN_RES"' EXIT

echo "Validating pdx-parks entrypoint at ${BASE_URL}/..."
ROOT_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" || echo "000")
if [ "$ROOT_CODE" -ne 200 ]; then
    echo "ERROR: Root entrypoint returned HTTP ${ROOT_CODE} (expected 200)"
    exit 1
fi

PAGE_CONTENT=$(curl -s "${BASE_URL}/" || true)
if ! echo "$PAGE_CONTENT" | grep -qi "PDX Parks"; then
    echo "ERROR: Entrypoint content does not contain 'PDX Parks'"
    exit 1
fi
echo "SUCCESS: PDX Parks web entrypoint verified."

echo "Checking login page at ${BASE_URL}/login..."
LOGIN_PAGE_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/login" || echo "000")
if [ "$LOGIN_PAGE_CODE" -ne 200 ]; then
    echo "ERROR: Login page returned HTTP ${LOGIN_PAGE_CODE} (expected 200)"
    exit 1
fi

echo "Submitting credentials for user: ${USERNAME}..."
AUTH_CODE=$(curl -s -c "$COOKIE_JAR" -o "$LOGIN_RES" -w "%{http_code}" \
    -X POST "${BASE_URL}/login" \
    -d "username=${USERNAME}&password=${PASSWORD}")

if [ "$AUTH_CODE" -ne 200 ] && [ "$AUTH_CODE" -ne 302 ]; then
    echo "ERROR: Authentication failed with HTTP ${AUTH_CODE}"
    cat "$LOGIN_RES"
    exit 1
fi

echo "Verifying admin dashboard access with session cookie..."
ADMIN_CODE=$(curl -s -b "$COOKIE_JAR" -o "$LOGIN_RES" -w "%{http_code}" "${BASE_URL}/admin")
if [ "$ADMIN_CODE" -ne 200 ]; then
    echo "ERROR: Admin dashboard returned HTTP ${ADMIN_CODE} (expected 200)"
    cat "$LOGIN_RES"
    exit 1
fi

if ! grep -qi "PDX Parks Admin Dashboard" "$LOGIN_RES" || ! grep -qi "Logout" "$LOGIN_RES"; then
    echo "ERROR: Admin dashboard content verification failed"
    cat "$LOGIN_RES"
    exit 1
fi
echo "SUCCESS: Admin session verified for user '${USERNAME}'."

echo "Testing negative authentication (false-positive prevention)..."
BAD_AUTH_CODE=$(curl -s -o /dev/null -w "%{http_code}" \
    -X POST "${BASE_URL}/login" \
    -d "username=${USERNAME}&password=WrongPassword123")
if [ "$BAD_AUTH_CODE" -ne 401 ]; then
    echo "ERROR: Invalid login returned HTTP ${BAD_AUTH_CODE} (expected 401)"
    exit 1
fi
echo "SUCCESS: Invalid credentials correctly rejected with HTTP 401."

echo "All login verifications passed successfully."
exit 0
