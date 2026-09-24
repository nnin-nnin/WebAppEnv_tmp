#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18534}"
BASE_URL="http://localhost:${HOST_PORT}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${USER:-admin}}}"
PASSWORD="${ADMIN_PASSWORD:-${PASSWORD:-AdminPassword123!}}"

echo "Checking Bludit login at ${BASE_URL}..."
COOKIE_JAR=$(mktemp)
trap 'rm -f "$COOKIE_JAR"' EXIT

LOGIN_PAGE=$(curl -s -c "$COOKIE_JAR" "${BASE_URL}/admin/")
CSRF_TOKEN=$(echo "$LOGIN_PAGE" | grep -o 'name="tokenCSRF" value="[^"]*"' | cut -d'"' -f4)

if [ -z "$CSRF_TOKEN" ]; then
    echo "FAILED: Could not retrieve CSRF token from login page"
    exit 1
fi

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -b "$COOKIE_JAR" -c "$COOKIE_JAR" -X POST \
    -d "tokenCSRF=${CSRF_TOKEN}&username=${USERNAME}&password=${PASSWORD}&save=" \
    "${BASE_URL}/admin/")

if [ "$HTTP_CODE" -eq 301 ] || [ "$HTTP_CODE" -eq 302 ] || [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: Login endpoint reachable and login succeeded (HTTP $HTTP_CODE)"
    exit 0
else
    echo "FAILED: Login returned HTTP $HTTP_CODE"
    exit 1
fi
