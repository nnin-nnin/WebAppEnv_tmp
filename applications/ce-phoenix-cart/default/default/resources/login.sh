#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18806}"
BASE_URL="http://127.0.0.1:${HOST_PORT}"

echo "Testing CE Phoenix Cart admin login accessibility at ${BASE_URL}/admin/login.php..."
COOKIE_JAR=$(mktemp)
trap 'rm -f "$COOKIE_JAR"' EXIT

# First GET: establishes session and redirect origin
HTTP_CODE=$(curl -s -L -c "$COOKIE_JAR" -b "$COOKIE_JAR" -o /dev/null -w "%{http_code}" "${BASE_URL}/admin/login.php")

if [ "$HTTP_CODE" -ge 200 ] && [ "$HTTP_CODE" -lt 400 ]; then
    echo "SUCCESS: CE Phoenix Cart login endpoint reachable (HTTP $HTTP_CODE)"
else
    echo "FAILED: Login endpoint returned HTTP $HTTP_CODE"
    exit 1
fi

echo "Testing administrator authentication with admin credentials..."
LOGIN_HTML=$(curl -s -L -c "$COOKIE_JAR" -b "$COOKIE_JAR" \
    -d "username=admin&password=AdminPassword123!" \
    "${BASE_URL}/admin/login.php?action=process")

if echo "$LOGIN_HTML" | grep -qi "Administration Tool"; then
    echo "SUCCESS: Administrator login verified successfully! (Found Administration Tool in dashboard)"
    exit 0
else
    echo "FAILED: Administration Tool not found in dashboard response"
    exit 1
fi
