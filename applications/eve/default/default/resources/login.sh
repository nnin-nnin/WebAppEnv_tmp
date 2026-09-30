#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18823}"
URL="http://127.0.0.1:${HOST_PORT}"
USERNAME="${ADMIN_USERNAME:-admin}"
PASSWORD="${ADMIN_PASSWORD:-AdminPassword123!}"

echo "Testing Eve API and Authentication on ${URL}..."

# 1. Test root API entrypoint
echo "1. Testing root API entry point (${URL}/)..."
ROOT_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${URL}/")
if [ "$ROOT_CODE" != "200" ]; then
    echo "FAILED: Root endpoint returned HTTP $ROOT_CODE"
    exit 1
fi
echo "SUCCESS: Root endpoint returned HTTP 200"

# 2. Test core resource endpoint
echo "2. Testing resource endpoint (${URL}/people)..."
PEOPLE_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${URL}/people")
if [ "$PEOPLE_CODE" != "200" ]; then
    echo "FAILED: /people endpoint returned HTTP $PEOPLE_CODE"
    exit 1
fi
echo "SUCCESS: /people returned HTTP 200"

# 3. Test protected endpoint unauthorized access
echo "3. Testing unauthorized access to protected resource (${URL}/users)..."
UNAUTH_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${URL}/users")
if [ "$UNAUTH_CODE" != "401" ]; then
    echo "FAILED: Expected HTTP 401 for unauthorized access, got HTTP $UNAUTH_CODE"
    exit 1
fi
echo "SUCCESS: Unauthorized access correctly returned HTTP 401"

# 4. Test Basic Authentication with Admin credentials
echo "4. Testing HTTP Basic Authentication for user '${USERNAME}' on ${URL}/users..."
AUTH_CODE=$(curl -s -o /dev/null -w "%{http_code}" -u "${USERNAME}:${PASSWORD}" "${URL}/users")
if [ "$AUTH_CODE" != "200" ]; then
    echo "FAILED: Basic Auth for user '${USERNAME}' returned HTTP $AUTH_CODE"
    exit 1
fi
echo "SUCCESS: User '${USERNAME}' successfully authenticated with HTTP 200"

# 5. Test Login API endpoint
echo "5. Testing /login endpoint with JSON payload..."
LOGIN_RESP=$(curl -s -X POST "${URL}/login" \
    -H "Content-Type: application/json" \
    -d "{\"username\": \"${USERNAME}\", \"password\": \"${PASSWORD}\"}")

if echo "$LOGIN_RESP" | grep -q '"status":"success"'; then
    echo "SUCCESS: Login endpoint authenticated user '${USERNAME}'"
else
    echo "FAILED: Login endpoint failed for user '${USERNAME}'"
    echo "$LOGIN_RESP"
    exit 1
fi

echo "Eve authentication and API verification PASSED!"
exit 0
