#!/usr/bin/env bash
set -e

APP_URL="${APP_URL:-http://127.0.0.1:8000}"
USERNAME="${USERNAME:-admin}"
PASSWORD="${PASSWORD:-changeme1234}"

echo "Attempting to login to Snipe-IT at $APP_URL..."

# Create a temporary file for cookies
COOKIE_JAR=$(mktemp)
trap 'rm -f "$COOKIE_JAR"' EXIT

# Fetch the login page to get the CSRF token and set initial cookies
echo "Fetching login page to get CSRF token..."
LOGIN_PAGE=$(curl -s -c "$COOKIE_JAR" "$APP_URL/login")

# Extract the CSRF token
# <meta name="csrf-token" content="TOKEN"> or <input type="hidden" name="_token" value="TOKEN">
CSRF_TOKEN=$(echo "$LOGIN_PAGE" | grep -o 'name="_token" value="[^"]*"' | head -n 1 | sed 's/name="_token" value="//' | sed 's/"//')

if [ -z "$CSRF_TOKEN" ]; then
    echo "Error: Could not extract CSRF token. Is the app running and setup completed?"
    exit 1
fi

echo "CSRF token extracted. Submitting login form..."

# Submit the login form
LOGIN_RESPONSE=$(curl -s -i -c "$COOKIE_JAR" -b "$COOKIE_JAR" -X POST "$APP_URL/login" \
    -d "_token=$CSRF_TOKEN" \
    -d "username=$USERNAME" \
    -d "password=$PASSWORD")

# Check for successful redirect (HTTP 302 Found) and location not /login
if echo "$LOGIN_RESPONSE" | grep -q "HTTP/1.1 302 Found" || echo "$LOGIN_RESPONSE" | grep -q "HTTP/1.1 302 Redirect"; then
    LOCATION=$(echo "$LOGIN_RESPONSE" | grep -i "Location:" | awk '{print $2}' | tr -d '\r')
    if [[ "$LOCATION" == *"/login"* ]]; then
        echo "Login failed! Redirected back to login."
        exit 1
    else
        echo "Login successful! Redirected to $LOCATION"
        
        # Verify access to dashboard
        echo "Verifying dashboard access..."
        DASHBOARD_HTTP_CODE=$(curl -s -L -o /dev/null -w "%{http_code}" -b "$COOKIE_JAR" "$APP_URL/")
        if [ "$DASHBOARD_HTTP_CODE" -eq 200 ]; then
            echo "Successfully accessed dashboard!"
            exit 0
        else
            echo "Failed to access dashboard. HTTP Code: $DASHBOARD_HTTP_CODE"
            exit 1
        fi
    fi
else
    echo "Login failed! Unexpected response."
    echo "$LOGIN_RESPONSE" | head -n 20
    exit 1
fi
