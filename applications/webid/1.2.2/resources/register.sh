#!/bin/bash
set -e

APP_URL=${APP_URL:-"http://127.0.0.1:18086"}
USER_NAME=${USER_NAME:-"testuser"}
USER_NICK=${USER_NICK:-"testuser"}
USER_PASSWORD=${USER_PASSWORD:-"password123"}
USER_EMAIL=${USER_EMAIL:-"testuser@example.com"}

echo "Registering user ($USER_NICK)..."

RESPONSE=$(curl -s -w "\n%{http_code}" -X POST \
    -d "action=first" \
    -d "terms_check=on" \
    -d "TPL_name=$USER_NAME" \
    -d "TPL_nick=$USER_NICK" \
    -d "TPL_password=$USER_PASSWORD" \
    -d "TPL_repeat_password=$USER_PASSWORD" \
    -d "TPL_email=$USER_EMAIL" \
    -d "TPL_address=123 Test St" \
    -d "TPL_city=Testville" \
    -d "TPL_prov=TS" \
    -d "TPL_country=United States" \
    -d "TPL_zip=12345" \
    -d "TPL_phone=555-0123" \
    -d "TPL_day=01" \
    -d "TPL_month=01" \
    -d "TPL_year=1990" \
    -d "TPL_nletter=2" \
    -d "TPL_timezone=UTC" \
    "$APP_URL/register.php")

HTTP_CODE=$(echo "$RESPONSE" | tail -n1)
BODY=$(echo "$RESPONSE" | sed '$d')

if echo "$BODY" | grep -qi "success" || echo "$BODY" | grep -qi "login"; then
    echo "User registered."
    exit 0
else
    # Check if there are any error messages or it redirects to second page
    if echo "$BODY" | grep -qi "error"; then
        echo "Registration failed with errors in response."
        echo "$BODY" | grep -i "error" | head -n 5
        exit 1
    fi
    echo "User registered (No apparent errors)."
    exit 0
fi
