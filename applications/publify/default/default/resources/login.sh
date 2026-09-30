#!/usr/bin/env bash
set -euo pipefail

TARGET_HOST="${PUBLIFY_HOST:-127.0.0.1}"
TARGET_PORT="${PUBLIFY_PORT:-18861}"
BASE_URL="http://${TARGET_HOST}:${TARGET_PORT}"

USERNAME="${PUBLIFY_ADMIN_USER:-admin}"
PASSWORD="${PUBLIFY_ADMIN_PASS:-AdminPassword123!}"

COOKIE_JAR="$(mktemp)"
trap 'rm -f "${COOKIE_JAR}"' EXIT

echo "=== [Publify Login Test] Step 1: Requesting sign-in page ==="
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

echo "=== [Publify Login Test] Step 2: Submitting login credentials ==="
LOGIN_RESP_HEADER=$(curl -s -S -i -b "${COOKIE_JAR}" -c "${COOKIE_JAR}" -X POST "${BASE_URL}/users/sign_in" \
  -d "authenticity_token=${CSRF_TOKEN}" \
  -d "user[login]=${USERNAME}" \
  -d "user[password]=${PASSWORD}" \
  -d "commit=Sign+in")

HTTP_CODE=$(echo "${LOGIN_RESP_HEADER}" | grep -E '^HTTP/[0-9.]+ ' | tail -1 | awk '{print $2}')
LOCATION=$(echo "${LOGIN_RESP_HEADER}" | grep -i '^Location:' | tail -1 | tr -d '\r\n' | awk '{print $2}')

echo "[+] Login HTTP response status: ${HTTP_CODE}"
echo "[+] Redirect location: ${LOCATION}"

if [ "${HTTP_CODE}" != "302" ]; then
  echo "[-] ERROR: Expected HTTP 302 redirect on successful login, received ${HTTP_CODE}."
  echo "${LOGIN_RESP_HEADER}"
  exit 1
fi

echo "=== [Publify Login Test] Step 3: Verifying authenticated access to admin dashboard ==="
ADMIN_HTML=$(curl -s -S -b "${COOKIE_JAR}" "${BASE_URL}/admin")

if grep -E "(admin|Dashboard|Sign out|Log out|Articles|Settings|Publify)" >/dev/null <<< "${ADMIN_HTML}"; then
  echo "[+] SUCCESS: Authenticated session confirmed on admin dashboard for '${USERNAME}'."
else
  echo "[-] ERROR: Authenticated session check failed. Dashboard does not contain expected markers."
  exit 1
fi

echo "=== [Publify Login Test] ALL VERIFICATIONS PASSED ==="
exit 0
