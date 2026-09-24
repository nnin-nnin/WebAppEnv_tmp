#!/bin/bash
set -e

APP_URL="${APP_URL:-http://127.0.0.1:18080}"
USERNAME="${USERNAME:-admin}"
PASSWORD="${PASSWORD:-admin123}"

echo "Attempting to login to $APP_URL as $USERNAME..."

RESPONSE=$(curl -s -X POST "$APP_URL/login" \
  -d "username=$USERNAME" \
  -d "password=$PASSWORD" \
  -d "rememberMe=false" \
  -H "Accept: application/json")

echo "Response: $RESPONSE"

if echo "$RESPONSE" | grep -q '"code":0'; then
    echo "Login successful."
    exit 0
else
    echo "Login failed."
    exit 1
fi
