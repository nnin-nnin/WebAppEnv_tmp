#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18858}"
ADMIN_USERNAME="${ADMIN_USERNAME:-admin}"
ADMIN_PASSWORD="${ADMIN_PASSWORD:-AdminPassword123!}"
BASE_URL="http://127.0.0.1:${HOST_PORT}"

echo "Validating admin login at ${BASE_URL}..."

COOKIE_FILE=$(mktemp)
trap 'rm -f "$COOKIE_FILE"' EXIT

LOGIN_PAGE=$(curl -s -c "$COOKIE_FILE" -b "$COOKIE_FILE" "${BASE_URL}/accounts/login/")
CSRF_TOKEN=$(echo "$LOGIN_PAGE" | grep -o 'name=.csrfmiddlewaretoken. value=.[^"]*' | head -n 1 | cut -d"'" -f4)

if [ -z "$CSRF_TOKEN" ]; then
    echo "ERROR: Failed to retrieve CSRF token from login page."
    exit 1
fi

LOGIN_RESPONSE=$(curl -s -c "$COOKIE_FILE" -b "$COOKIE_FILE" -i \
  -H "Referer: ${BASE_URL}/accounts/login/" \
  -d "csrfmiddlewaretoken=${CSRF_TOKEN}" \
  -d "login=${ADMIN_USERNAME}" \
  -d "password=${ADMIN_PASSWORD}" \
  "${BASE_URL}/accounts/login/")

if ! echo "$LOGIN_RESPONSE" | grep -q "sessionid="; then
    echo "ERROR: Login failed, sessionid cookie not received."
    echo "$LOGIN_RESPONSE" | head -n 20
    exit 1
fi

DASHBOARD_RESPONSE=$(curl -s -L -c "$COOKIE_FILE" -b "$COOKIE_FILE" "${BASE_URL}/")

if echo "$DASHBOARD_RESPONSE" | grep -q -E "user-username|Sign out|Public Profile"; then
    echo "SUCCESS: Admin login verified successfully for user '${ADMIN_USERNAME}'!"
    exit 0
else
    echo "ERROR: Admin dashboard closure validation failed."
    exit 1
fi
