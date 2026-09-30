#!/usr/bin/env bash
set -euo pipefail

HOST_PORT="${HOST_PORT:-18878}"
BASE_URL="${APP_URL:-${BASE_URL:-http://127.0.0.1:${HOST_PORT}}}"
USERNAME="${1:-${ADMIN_USERNAME:-admin}}"
PASSWORD="${2:-${ADMIN_PASSWORD:-AdminPassword123!}}"

COOKIE_JAR="$(mktemp)"
LOGIN_RES="$(mktemp)"
trap 'rm -f "$COOKIE_JAR" "$LOGIN_RES"' EXIT

echo "Validating Z-BlogPHP entrypoint at ${BASE_URL}/..."
ROOT_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" || echo "000")
if [ "$ROOT_CODE" -ne 200 ] && [ "$ROOT_CODE" -ne 302 ]; then
    echo "ERROR: Root entrypoint returned HTTP ${ROOT_CODE} (expected 200 or 302)"
    exit 1
fi
echo "SUCCESS: Z-BlogPHP root entrypoint reachable (HTTP ${ROOT_CODE})."

echo "Checking login page at ${BASE_URL}/zb_system/login.php..."
LOGIN_PAGE=$(curl -s -c "$COOKIE_JAR" "${BASE_URL}/zb_system/login.php" || true)
if ! echo "$LOGIN_PAGE" | grep -qiE "(csrfToken|Z-BlogPHP)"; then
    echo "ERROR: Login page content does not match Z-BlogPHP"
    exit 1
fi

CSRF_TOKEN=$(echo "$LOGIN_PAGE" | grep 'name="csrfToken"' | head -n 1 | sed -E 's/.*value="([^"]+)".*/\1/')
if [ -z "$CSRF_TOKEN" ]; then
    echo "ERROR: Failed to extract csrfToken from login page"
    exit 1
fi
echo "SUCCESS: Retrieved CSRF token."

echo "Submitting credentials for user: ${USERNAME}..."
PASS_MD5=$(echo -n "${PASSWORD}" | (md5 -q 2>/dev/null || md5sum | awk '{print $1}'))

VERIFY_RESP=$(curl -s -i -b "$COOKIE_JAR" -c "$COOKIE_JAR" \
    -e "${BASE_URL}/zb_system/login.php" \
    -d "csrfToken=${CSRF_TOKEN}&username=${USERNAME}&password=${PASS_MD5}&savedate=1" \
    "${BASE_URL}/zb_system/cmd.php?act=verify")

if ! echo "$VERIFY_RESP" | grep -qiE "(302 Found|Location:.*admin)"; then
    echo "ERROR: Authentication failed for user '${USERNAME}'"
    echo "$VERIFY_RESP" | head -n 30
    exit 1
fi

DASHBOARD=$(curl -s -L -b "$COOKIE_JAR" "${BASE_URL}/zb_system/admin/index.php?act=admin")
if ! echo "$DASHBOARD" | grep -qiE "(Z-BlogPHP|logout|act=logout|admin)"; then
    echo "ERROR: Admin dashboard verification failed"
    echo "$DASHBOARD" | head -n 30
    exit 1
fi
echo "SUCCESS: Authenticated and admin dashboard verified for user '${USERNAME}'."

echo "Testing negative authentication (false-positive prevention)..."
BAD_COOKIE_JAR="$(mktemp)"
BAD_PAGE=$(curl -s -c "$BAD_COOKIE_JAR" "${BASE_URL}/zb_system/login.php" || true)
BAD_CSRF=$(echo "$BAD_PAGE" | grep 'name="csrfToken"' | head -n 1 | sed -E 's/.*value="([^"]+)".*/\1/')
BAD_MD5=$(echo -n "WrongPassword999" | (md5 -q 2>/dev/null || md5sum | awk '{print $1}'))

BAD_RESP=$(curl -s -i -b "$BAD_COOKIE_JAR" -c "$BAD_COOKIE_JAR" \
    -e "${BASE_URL}/zb_system/login.php" \
    -d "csrfToken=${BAD_CSRF}&username=${USERNAME}&password=${BAD_MD5}&savedate=1" \
    "${BASE_URL}/zb_system/cmd.php?act=verify")
rm -f "$BAD_COOKIE_JAR"

if echo "$BAD_RESP" | grep -qi "302 Found" && echo "$BAD_RESP" | grep -qi "Location:.*admin"; then
    echo "ERROR: False-positive detected! Invalid login was mistakenly accepted"
    exit 1
fi
echo "SUCCESS: Invalid credentials correctly rejected."

echo "All login verifications passed successfully."
exit 0
