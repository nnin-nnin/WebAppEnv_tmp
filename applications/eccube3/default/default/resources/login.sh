#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18820}"
BASE_URL="http://127.0.0.1:${HOST_PORT}"

echo "Testing ECCube3 admin login accessibility at ${BASE_URL}/admin/..."
COOKIE_JAR=$(mktemp)
trap 'rm -f "$COOKIE_JAR"' EXIT

LOGIN_PAGE=$(curl -s -L -c "$COOKIE_JAR" -b "$COOKIE_JAR" "${BASE_URL}/admin/")
CSRF_TOKEN=$(echo "$LOGIN_PAGE" | grep -o 'name="_csrf_token" value="[^"]*"' | head -n 1 | sed 's/.*value="//;s/"//')

if [ -z "$CSRF_TOKEN" ]; then
    echo "FAILED: Unable to extract CSRF token from login page"
    exit 1
fi

echo "Testing administrator authentication with admin credentials..."
LOGIN_RESP=$(curl -s -i -L -c "$COOKIE_JAR" -b "$COOKIE_JAR" \
    --data-urlencode "login_id=admin" \
    --data-urlencode "password=AdminPassword123!" \
    --data-urlencode "_csrf_token=${CSRF_TOKEN}" \
    "${BASE_URL}/admin/login_check")

DASHBOARD_HTML=$(curl -s -L -c "$COOKIE_JAR" -b "$COOKIE_JAR" "${BASE_URL}/admin/")

if echo "$DASHBOARD_HTML" | grep -qi -E "(管理者|ログアウト|EC-CUBE管理画面)"; then
    echo "SUCCESS: Administrator login verified successfully! (Found admin dashboard indicators)"
    exit 0
else
    echo "FAILED: Admin dashboard indicators not found in response"
    exit 1
fi
