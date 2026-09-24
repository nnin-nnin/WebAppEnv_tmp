#!/usr/bin/env bash
set -e
APP_URL=${APP_URL:-"http://127.0.0.1:8080"}
ADMIN_USER=${ADMIN_USER:-"admin"}
ADMIN_PASS=${ADMIN_PASS:-"123456"}
NEW_USER=${1}
NEW_PASS=${2}

if [ -z "$NEW_USER" ] || [ -z "$NEW_PASS" ]; then
    echo "Usage: $0 <new_username> <new_password>"
    exit 1
fi

COOKIE_FILE=$(mktemp)
curl -s -c "$COOKIE_FILE" -d "username=$ADMIN_USER" -d "pass=$ADMIN_PASS" "$APP_URL/manageuser.php?action=login" >/dev/null

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -b "$COOKIE_FILE" \
    -d "name=$NEW_USER" \
    -d "pass=$NEW_PASS" \
    -d "email=$NEW_USER@example.com" \
    -d "company=0" \
    -d "role=2" \
    -d "rate=0" \
    "$APP_URL/admin.php?action=adduser")

if [ "$HTTP_CODE" = "302" ] || [ "$HTTP_CODE" = "301" ]; then
    echo "User $NEW_USER registered successfully"
    rm -f "$COOKIE_FILE"
    exit 0
else
    echo "Failed to register user. HTTP Code: $HTTP_CODE"
    rm -f "$COOKIE_FILE"
    exit 1
fi
