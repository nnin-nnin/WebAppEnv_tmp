#!/usr/bin/env bash
set -euo pipefail

TARGET_HOST="${THREDDED_HOST:-127.0.0.1}"
TARGET_PORT="${THREDDED_PORT:-18870}"
BASE_URL="http://${TARGET_HOST}:${TARGET_PORT}"

USERNAME="${THREDDED_ADMIN_USER:-admin@example.com}"
PASSWORD="${THREDDED_ADMIN_PASS:-AdminPassword123!}"

COOKIE_JAR="$(mktemp)"
trap 'rm -f "${COOKIE_JAR}"' EXIT

echo "=== [Thredded Login Test] Step 1: Checking Thredded forum availability ==="
FORUM_HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/thredded")
if [ "${FORUM_HTTP_CODE}" != "200" ]; then
  echo "[-] ERROR: Thredded forum GET /thredded returned HTTP ${FORUM_HTTP_CODE} (expected 200)"
  exit 1
fi
echo "[+] Thredded forum is accessible (HTTP 200)."

echo "=== [Thredded Login Test] Step 2: Authenticating as Administrator (${USERNAME}) ==="
LOGIN_RESPONSE=$(curl -s -c "${COOKIE_JAR}" -b "${COOKIE_JAR}" -w "\n%{http_code}" -X POST "${BASE_URL}/user_sessions" \
  -d "email=${USERNAME}&name=admin&password=${PASSWORD}&admin=1")

HTTP_CODE=$(echo "${LOGIN_RESPONSE}" | tail -n 1)
echo "[+] Login HTTP response status: ${HTTP_CODE}"

if [ "${HTTP_CODE}" != "200" ] && [ "${HTTP_CODE}" != "302" ]; then
  echo "[-] ERROR: Expected HTTP 200 or 302 on login, received ${HTTP_CODE}."
  exit 1
fi

echo "=== [Thredded Login Test] Step 3: Verifying authenticated session on forum ==="
AUTH_PAGE=$(curl -s -b "${COOKIE_JAR}" "${BASE_URL}/thredded")

if echo "${AUTH_PAGE}" | grep -q "Sign out"; then
  echo "[+] Authenticated session confirmed: 'Sign out' link present in forum header."
elif echo "${AUTH_PAGE}" | grep -qi "admin"; then
  echo "[+] Authenticated session confirmed: administrator profile detected in forum."
else
  echo "[-] ERROR: Forum page does not show authenticated session."
  exit 1
fi

echo "=== [Thredded Login Test] ALL VERIFICATIONS PASSED ==="
exit 0
