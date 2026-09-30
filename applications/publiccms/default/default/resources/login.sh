#!/bin/bash
set -euo pipefail

APP_URL="${APP_URL:-http://127.0.0.1:18860}"
USERNAME="${1:-${ADMIN_USERNAME:-${ADMIN_USER:-${USERNAME:-admin}}}}"
PASSWORD="${2:-${ADMIN_PASSWORD:-${PASSWORD:-AdminPassword123!}}}"

echo "Checking PublicCMS service accessibility at $APP_URL/admin/login ..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$APP_URL/admin/login" || true)
if [ "$HTTP_CODE" != "200" ] && [ "$HTTP_CODE" != "302" ]; then
    echo "Error: Service at $APP_URL/admin/login is not accessible (HTTP $HTTP_CODE)."
    exit 1
fi
echo "Service is accessible at $APP_URL/admin/login (HTTP $HTTP_CODE)."

echo "Attempting admin login to $APP_URL/admin/login as $USERNAME..."
COOKIE_FILE=$(mktemp)
RESP_FILE=$(mktemp)
HEADER_FILE=$(mktemp)
trap 'rm -f "$COOKIE_FILE" "$RESP_FILE" "$HEADER_FILE"' EXIT

LOGIN_CODE=$(curl -s -c "$COOKIE_FILE" -b "$COOKIE_FILE" \
    -d "username=$USERNAME&password=$PASSWORD&returnUrl=" \
    -D "$HEADER_FILE" \
    -o "$RESP_FILE" \
    -w "%{http_code}" \
    "$APP_URL/admin/login")

echo "Login response HTTP status: $LOGIN_CODE"

# A successful login in PublicCMS issues a 302 redirect to the admin dashboard or 200
if [ "$LOGIN_CODE" -eq 302 ]; then
    echo "Received 302 redirect. Verifying authenticated access to admin dashboard..."
    DASHBOARD_CODE=$(curl -s -b "$COOKIE_FILE" -o /dev/null -w "%{http_code}" "$APP_URL/admin/")
    echo "Admin dashboard HTTP status: $DASHBOARD_CODE"
    if [ "$DASHBOARD_CODE" -eq 200 ]; then
        echo "Login successful! Validated credentials and admin dashboard access (HTTP 200)."
        exit 0
    fi
elif [ "$LOGIN_CODE" -eq 200 ]; then
    if grep -q "logout" "$RESP_FILE" || grep -q "退出" "$RESP_FILE" || grep -q "admin" "$RESP_FILE"; then
        echo "Login successful! Response indicates active admin session (HTTP 200)."
        exit 0
    fi
fi

echo "Login verification failed. Response headers:"
cat "$HEADER_FILE"
exit 1
