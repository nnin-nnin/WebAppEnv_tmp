#!/bin/bash
set -e

APP_URL=${APP_URL:-"http://127.0.0.1:18086"}
ADMIN_USERNAME=${ADMIN_USERNAME:-"admin"}
ADMIN_PASSWORD=${ADMIN_PASSWORD:-"password123"}

echo "Logging in as admin ($ADMIN_USERNAME)..."

RESPONSE=$(curl -s -w "\n%{http_code}" -X POST \
    -d "action=login" \
    -d "username=$ADMIN_USERNAME" \
    -d "password=$ADMIN_PASSWORD" \
    -c cookie.txt \
    "$APP_URL/admin/login.php")

HTTP_CODE=$(echo "$RESPONSE" | tail -n1)

# WeBid redirects to index.php on successful login (302)
if [ "$HTTP_CODE" = "302" ]; then
    echo "Login successful! (Redirected)"
    
    # Verify by accessing index.php
    VERIFY=$(curl -s -w "\n%{http_code}" -b cookie.txt -L "$APP_URL/admin/index.php")
    VERIFY_CODE=$(echo "$VERIFY" | tail -n1)
    
    if [ "$VERIFY_CODE" = "200" ]; then
        echo "Admin dashboard accessed successfully."
        rm -f cookie.txt
        exit 0
    else
        echo "Failed to access admin dashboard. HTTP code: $VERIFY_CODE"
        rm -f cookie.txt
        exit 1
    fi
else
    echo "Login failed. HTTP code: $HTTP_CODE"
    exit 1
fi
