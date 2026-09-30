#!/usr/bin/env bash
set -euo pipefail

TARGET_HOST="${DIASPORA_HOST:-127.0.0.1}"
TARGET_PORT="${DIASPORA_PORT:-18815}"
BASE_URL="http://${TARGET_HOST}:${TARGET_PORT}"

USERNAME="${DIASPORA_ADMIN_USER:-admin}"
PASSWORD="${DIASPORA_ADMIN_PASS:-AdminPassword123!}"

COOKIE_JAR="$(mktemp)"
trap 'rm -f "${COOKIE_JAR}"' EXIT

echo "=== [Diaspora Login Test] Step 1: Requesting sign-in page ==="
SIGNIN_HTML=$(curl -s -S -c "${COOKIE_JAR}" "${BASE_URL}/users/sign_in")

CSRF_TOKEN=$(echo "${SIGNIN_HTML}" | grep -o 'name="authenticity_token" value="[^"]*"' | head -1 | sed -E 's/.*value="([^"]+)".*/\1/' || true)

if [ -z "${CSRF_TOKEN}" ]; then
  CSRF_TOKEN=$(echo "${SIGNIN_HTML}" | grep -o 'name="csrf-token" content="[^"]*"' | head -1 | sed -E 's/.*content="([^"]+)".*/\1/' || true)
fi

if [ -z "${CSRF_TOKEN}" ]; then
  echo "[-] ERROR: Failed to extract authenticity_token from sign-in page."
  exit 1
fi

echo "[+] Obtained CSRF authenticity token."

echo "=== [Diaspora Login Test] Step 2: Submitting login credentials ==="
LOGIN_RESP_HEADER=$(curl -s -S -i -b "${COOKIE_JAR}" -c "${COOKIE_JAR}" -X POST "${BASE_URL}/users/sign_in" \
  -d "authenticity_token=${CSRF_TOKEN}" \
  -d "user[username]=${USERNAME}" \
  -d "user[password]=${PASSWORD}" \
  -d "commit=Sign in")

HTTP_CODE=$(echo "${LOGIN_RESP_HEADER}" | grep -E '^HTTP/[0-9.]+ ' | tail -1 | awk '{print $2}')
LOCATION=$(echo "${LOGIN_RESP_HEADER}" | grep -i '^Location:' | tail -1 | tr -d '\r\n' | awk '{print $2}')

echo "[+] Login HTTP response status: ${HTTP_CODE}"
echo "[+] Redirect location: ${LOCATION}"

if [ "${HTTP_CODE}" != "302" ]; then
  echo "[-] ERROR: Expected HTTP 302 redirect on successful login, received ${HTTP_CODE}."
  echo "${LOGIN_RESP_HEADER}"
  exit 1
fi

echo "=== [Diaspora Login Test] Step 3: Verifying authenticated admin access ==="
ADMIN_DASHBOARD_CODE=$(curl -s -S -o /dev/null -w "%{http_code}" -b "${COOKIE_JAR}" "${BASE_URL}/admins/dashboard")

if [ "${ADMIN_DASHBOARD_CODE}" = "200" ]; then
  echo "[+] SUCCESS: Administrator dashboard accessible (HTTP 200 OK) for '${USERNAME}'."
else
  STREAM_CODE=$(curl -s -S -o /dev/null -w "%{http_code}" -b "${COOKIE_JAR}" "${BASE_URL}/stream")
  if [ "${STREAM_CODE}" = "200" ]; then
    echo "[+] SUCCESS: User stream accessible (HTTP 200 OK) for '${USERNAME}'."
  else
    echo "[-] ERROR: Authenticated session check failed. Dashboard code: ${ADMIN_DASHBOARD_CODE}, Stream code: ${STREAM_CODE}."
    exit 1
  fi
fi

echo "=== [Diaspora Login Test] ALL VERIFICATIONS PASSED ==="
exit 0
