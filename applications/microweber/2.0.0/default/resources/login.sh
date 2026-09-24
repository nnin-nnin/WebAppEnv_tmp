#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18545}"
BASE_URL="http://localhost:${HOST_PORT}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-admin@benchmark.local}}}"
PASSWORD="${ADMIN_PASSWORD:-${APP_PASSWORD:-${PASSWORD:-AdminPassword123!}}}"

echo "Checking Microweber login at ${BASE_URL} for user ${USERNAME}..."

COOKIE_JAR=$(mktemp)
trap 'rm -f "$COOKIE_JAR"' EXIT

# Fetch initial session
curl -s -c "$COOKIE_JAR" "${BASE_URL}/" > /dev/null

# Attempt API login
RESPONSE=$(curl -s -b "$COOKIE_JAR" -c "$COOKIE_JAR" -X POST \
    -H "Accept: application/json" \
    -H "X-Requested-With: XMLHttpRequest" \
    -d "username=${USERNAME}&password=${PASSWORD}" \
    "${BASE_URL}/api/user_login")

if echo "$RESPONSE" | grep -q '"success"'; then
    echo "SUCCESS: Login endpoint reachable and login succeeded"
    exit 0
else
    echo "FAILED: Login returned: $RESPONSE"
    exit 1
fi
