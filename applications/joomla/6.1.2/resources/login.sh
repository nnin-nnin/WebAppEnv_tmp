#!/bin/bash
set -e

APP_URL=${APP_URL:-"http://127.0.0.1:18535"}
USERNAME=${USERNAME:-"admin"}
PASSWORD=${PASSWORD:-"12345678password"}
COOKIES_FILE=$(mktemp)
trap 'rm -f "$COOKIES_FILE"' EXIT

echo "Fetching login page to get CSRF token..."
HTML=$(curl -c "$COOKIES_FILE" -s "$APP_URL/administrator/index.php")

# Extract the CSRF token. In Joomla, the token is a 32-character hex string used as a hidden input name with value="1"
TOKEN=$(echo "$HTML" | grep -o 'name="[a-f0-9]\{32\}" value="1"' | head -n 1 | grep -o '[a-f0-9]\{32\}')

if [ -z "$TOKEN" ]; then
    echo "Failed to extract CSRF token. Maybe Joomla is not initialized yet or the page format changed."
    exit 1
fi

echo "Found token: $TOKEN"

echo "Attempting login..."
LOGIN_RESPONSE=$(curl -b "$COOKIES_FILE" -c "$COOKIES_FILE" -s -i -X POST "$APP_URL/administrator/index.php?option=com_login&task=login" \
    -d "username=$USERNAME" \
    -d "passwd=$PASSWORD" \
    -d "option=com_login" \
    -d "task=login" \
    -d "return=aW5kZXgucGhw" \
    -d "$TOKEN=1")

if echo "$LOGIN_RESPONSE" | grep -iq "303 See Other"; then
    echo "Login successful!"
    exit 0
else
    echo "Login failed. Response:"
    echo "$LOGIN_RESPONSE" | head -n 20
    exit 1
fi
