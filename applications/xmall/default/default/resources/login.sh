#!/usr/bin/env bash
set -euo pipefail

HOST_PORT="${HOST_PORT:-18876}"
BASE_URL="${APP_URL:-${BASE_URL:-http://127.0.0.1:${HOST_PORT}}}"
USERNAME="${1:-${ADMIN_USERNAME:-admin}}"
PASSWORD="${2:-${ADMIN_PASSWORD:-AdminPassword123!}}"

COOKIE_JAR="$(mktemp)"
LOGIN_RES="$(mktemp)"
trap 'rm -f "$COOKIE_JAR" "$LOGIN_RES"' EXIT

echo "Validating XMall entrypoint at ${BASE_URL}/..."
ROOT_CODE="000"
for attempt in {1..15}; do
    RAW_CODE=$(curl -s -o /dev/null -w "%{http_code}" --max-time 5 "${BASE_URL}/" 2>/dev/null || true)
    if [ -n "$RAW_CODE" ]; then
        ROOT_CODE="${RAW_CODE: -3}"
        if [ "$ROOT_CODE" -eq 200 ] || [ "$ROOT_CODE" -eq 302 ]; then
            break
        fi
    fi
    sleep 2
done

if [ "$ROOT_CODE" -ne 200 ] && [ "$ROOT_CODE" -ne 302 ]; then
    echo "ERROR: Root entrypoint returned HTTP ${ROOT_CODE} (expected 200 or 302)"
    exit 1
fi
echo "SUCCESS: XMall entrypoint reachable (HTTP ${ROOT_CODE})."

echo "Checking login page at ${BASE_URL}/login..."
LOGIN_CODE=$(curl -s -o /dev/null -w "%{http_code}" -c "$COOKIE_JAR" "${BASE_URL}/login" 2>/dev/null || echo "000")
LOGIN_CODE="${LOGIN_CODE: -3}"
if [ "$LOGIN_CODE" -ne 200 ] && [ "$LOGIN_CODE" -ne 302 ]; then
    echo "WARNING: Login page returned HTTP ${LOGIN_CODE}, continuing with API..."
fi

# Optional geetest init to prime session if needed
curl -s -c "$COOKIE_JAR" -b "$COOKIE_JAR" "${BASE_URL}/geetestInit" > /dev/null 2>&1 || true

echo "Submitting credentials for user: ${USERNAME}..."
LOGIN_RESP=$(curl -s -b "$COOKIE_JAR" -c "$COOKIE_JAR" \
    -X POST "${BASE_URL}/user/login" \
    -d "username=${USERNAME}&password=${PASSWORD}&challenge=&validate=&seccode=")

# If empty challenge was rejected, try with failback parameters
if ! echo "$LOGIN_RESP" | grep -qiE '("success"\s*:\s*true|"status"\s*:\s*200|"code"\s*:\s*200)'; then
    LOGIN_RESP=$(curl -s -b "$COOKIE_JAR" -c "$COOKIE_JAR" \
        -X POST "${BASE_URL}/user/login" \
        -d "username=${USERNAME}&password=${PASSWORD}&challenge=1&validate=1&seccode=1")
fi

echo "Login response: ${LOGIN_RESP}"

if ! echo "$LOGIN_RESP" | grep -qiE '("success"\s*:\s*true|"status"\s*:\s*200|"code"\s*:\s*200)'; then
    echo "ERROR: Authentication failed for user '${USERNAME}'"
    exit 1
fi

echo "Verifying authenticated session via ${BASE_URL}/user/userInfo..."
USER_INFO=$(curl -s -b "$COOKIE_JAR" "${BASE_URL}/user/userInfo")
echo "User info response: ${USER_INFO}"

if ! echo "$USER_INFO" | grep -qiE "(\"username\"\s*:\s*\"${USERNAME}\"|\"id\"\s*:\s*1)"; then
    echo "ERROR: User info verification failed"
    exit 1
fi
echo "SUCCESS: Authenticated and admin session verified for user '${USERNAME}'."

echo "Testing negative authentication (false-positive prevention)..."
BAD_COOKIE_JAR="$(mktemp)"
BAD_RESP=$(curl -s -b "$BAD_COOKIE_JAR" -c "$BAD_COOKIE_JAR" \
    -X POST "${BASE_URL}/user/login" \
    -d "username=${USERNAME}&password=WrongPassword999&challenge=&validate=&seccode=")
rm -f "$BAD_COOKIE_JAR"

if echo "$BAD_RESP" | grep -qiE '("success"\s*:\s*true|"status"\s*:\s*200|"code"\s*:\s*200)'; then
    echo "ERROR: False-positive detected! Invalid login was mistakenly accepted"
    exit 1
fi
echo "SUCCESS: Invalid credentials correctly rejected."

echo "All login verifications passed successfully."
exit 0
