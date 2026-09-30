#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18657}"
BASE_URL="${BASE_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${1:-${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-admin}}}}"
PASSWORD="${2:-${ADMIN_PASSWORD:-${APP_PASSWORD:-Admin123456!}}}"

echo "Checking Lychee availability at ${BASE_URL}/..."
HTTP_CODE=$(curl -s -L -o /dev/null -w "%{http_code}" "${BASE_URL}/")

if [ "$HTTP_CODE" -ne 200 ]; then
  echo "FAILED: Expected HTTP 200 but received ${HTTP_CODE} from ${BASE_URL}/"
  exit 1
fi
echo "HTTP 200 OK verified."

echo "Testing login for Lychee at ${BASE_URL} with user ${USERNAME}..."

COOKIE_FILE="$(mktemp)"
trap 'rm -f "$COOKIE_FILE"' EXIT

# Step 1: Initial request to obtain session and XSRF-TOKEN
curl -s -c "$COOKIE_FILE" "${BASE_URL}/" > /dev/null

XSRF_RAW=$(grep "XSRF-TOKEN" "$COOKIE_FILE" | awk '{print $7}')
if [ -z "$XSRF_RAW" ]; then
  echo "FAILED: Unable to retrieve XSRF-TOKEN cookie."
  exit 1
fi

# URL decode the XSRF token
DECODED_XSRF=$(python3 -c "import urllib.parse, sys; print(urllib.parse.unquote(sys.argv[1]))" "$XSRF_RAW")

# Step 2: POST credentials to /api/Session::login
LOGIN_CODE=$(curl -s -o /dev/null -w "%{http_code}" -b "$COOKIE_FILE" -c "$COOKIE_FILE" \
  -X POST "${BASE_URL}/api/Session::login" \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -H "X-XSRF-TOKEN: ${DECODED_XSRF}" \
  -d "{\"username\":\"${USERNAME}\",\"password\":\"${PASSWORD}\"}")

if [ "$LOGIN_CODE" -ne 200 ] && [ "$LOGIN_CODE" -ne 204 ]; then
  echo "FAILED: Login request failed with HTTP ${LOGIN_CODE}."
  exit 1
fi

# Step 3: Verify authenticated user
USER_RESP=$(curl -s -b "$COOKIE_FILE" \
  -X POST "${BASE_URL}/api/User::getAuthenticatedUser" \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -H "X-XSRF-TOKEN: ${DECODED_XSRF}")

if echo "$USER_RESP" | grep -qi "\"username\":\"${USERNAME}\""; then
  echo "SUCCESS: Successfully authenticated as ${USERNAME} and verified user access!"
  exit 0
fi

echo "FAILED: Authentication verification failed. Response: ${USER_RESP}"
exit 1
