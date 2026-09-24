#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18557}"
BASE_URL="http://localhost:${HOST_PORT}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${USER:-admin}}}"
PASSWORD="${ADMIN_PASSWORD:-${PASSWORD:-AdminPassword123!}}"

echo "Checking Openfire admin login at ${BASE_URL}..."

COOKIE_JAR=$(mktemp)
trap 'rm -f "$COOKIE_JAR"' EXIT

LOGIN_RESP=$(curl -s -i -b "$COOKIE_JAR" -c "$COOKIE_JAR" -X POST \
    -d "login=true&username=${USERNAME}&password=${PASSWORD}" \
    "${BASE_URL}/login.jsp")

if echo "$LOGIN_RESP" | grep -q "Location:.*index.jsp"; then
    echo "SUCCESS: Login endpoint redirected to index.jsp!"
else
    INDEX_HTML=$(curl -s -b "$COOKIE_JAR" "${BASE_URL}/index.jsp")
    if echo "$INDEX_HTML" | grep -qi "Admin Console"; then
        echo "SUCCESS: Admin console verified after login!"
    else
        echo "FAILED: Openfire admin login failed"
        echo "$LOGIN_RESP" | head -n 10
        exit 1
    fi
fi

INDEX_PAGE=$(curl -s -b "$COOKIE_JAR" "${BASE_URL}/index.jsp")
if echo "$INDEX_PAGE" | grep -qi "Admin Console"; then
    echo "SUCCESS: Verified authenticated access to Openfire Admin Console!"
    exit 0
else
    echo "FAILED: Could not access Admin Console after login"
    exit 1
fi
