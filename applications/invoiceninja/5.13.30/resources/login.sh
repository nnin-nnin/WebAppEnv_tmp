#!/usr/bin/env bash
set -e

APP_URL="${APP_URL:-http://127.0.0.1:18085}"
USERNAME="${USERNAME:-admin@example.com}"
PASSWORD="${PASSWORD:-adminpassword}"

echo "Attempting to log in as $USERNAME to $APP_URL..."

# Some InvoiceNinja configurations might not use sanctum csrf for initial login
# We just POST to api/v1/login with email and password, which should return token
HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" -X POST "$APP_URL/api/v1/login" \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -H "X-Requested-With: XMLHttpRequest" \
  -d "{\"email\":\"$USERNAME\",\"password\":\"$PASSWORD\"}")

if [[ "$HTTP_STATUS" == 2* ]]; then
    echo "Login successful."
    exit 0
else
    echo "Login failed. HTTP Status: $HTTP_STATUS"
    # fallback to trying to get CSRF
    COOKIE_JAR=$(mktemp)
    curl -s -c "$COOKIE_JAR" "$APP_URL/sanctum/csrf-cookie" > /dev/null
    XSRF_TOKEN=$(grep XSRF-TOKEN "$COOKIE_JAR" | awk '{print $7}' | cut -d% -f1)
    
    HTTP_STATUS2=$(curl -s -o /dev/null -w "%{http_code}" -X POST "$APP_URL/api/v1/login" \
      -H "Content-Type: application/json" \
      -H "Accept: application/json" \
      -H "X-Requested-With: XMLHttpRequest" \
      -H "X-XSRF-TOKEN: $XSRF_TOKEN" \
      -b "$COOKIE_JAR" -c "$COOKIE_JAR" \
      -d "{\"email\":\"$USERNAME\",\"password\":\"$PASSWORD\"}")
      
    rm -f "$COOKIE_JAR"
    if [[ "$HTTP_STATUS2" == 2* ]]; then
        echo "Login successful with CSRF."
        exit 0
    else
        echo "Login failed with CSRF. HTTP Status: $HTTP_STATUS2"
        exit 1
    fi
fi
