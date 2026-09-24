#!/bin/bash
APP_URL=${APP_URL:-http://localhost:18088}
USERNAME=${USERNAME:-admin}
PASSWORD=${PASSWORD:-benchmark-only}

echo "Attempting login to $APP_URL as $USERNAME..."
COOKIE_FILE=$(mktemp)
curl -s -L -c $COOKIE_FILE -d "username=$USERNAME&password=$PASSWORD&rememberme=0&action=login" $APP_URL/login.php > /tmp/login_out

grep -qi "logout" /tmp/login_out || grep -qi "profile" /tmp/login_out || grep -qi "Welcome" /tmp/login_out
if [ $? -eq 0 ]; then
    echo "Login successful!"
    rm $COOKIE_FILE
    exit 0
else
    echo "Login failed. Output excerpt:"
    head -n 20 /tmp/login_out
    rm $COOKIE_FILE
    exit 1
fi
