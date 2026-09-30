#!/bin/bash
set -e

APP_URL=${APP_URL:-"http://127.0.0.1:8085"}
USERNAME=${USERNAME:-"admin"}
PASSWORD=${PASSWORD:-"pass"}

echo "Attempting to login to ${APP_URL} as ${USERNAME}..."

COOKIE_JAR=$(mktemp)

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -c "$COOKIE_JAR" -b "$COOKIE_JAR" \
    -d "new_login_session_management=1" -d "authUser=$USERNAME" -d "clearPass=$PASSWORD" \
    -d "languageChoice=1" \
    "$APP_URL/interface/main/main_screen.php?auth=login&site=default")

if [ "$HTTP_CODE" -eq 302 ]; then
    echo "Login successful! HTTP_CODE=$HTTP_CODE"
    rm -f "$COOKIE_JAR"
    exit 0
fi

echo "Login failed. HTTP_CODE=$HTTP_CODE"
rm -f "$COOKIE_JAR"
exit 1
