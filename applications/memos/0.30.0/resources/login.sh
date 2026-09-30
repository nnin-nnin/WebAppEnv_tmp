#!/usr/bin/env bash
set -e

APP_URL="${APP_URL:-http://127.0.0.1:5230}"
USERNAME="${1:-${MEMOS_USERNAME:-admin}}"
PASSWORD="${2:-${MEMOS_PASSWORD:-123456}}"

echo "Logging in as ${USERNAME} at ${APP_URL}..."

RESPONSE=$(curl -s -w "\n%{http_code}" -X POST "${APP_URL}/api/v1/auth/signin" \
  -H 'Content-Type: application/json' \
  -d "{\"passwordCredentials\":{\"username\":\"${USERNAME}\",\"password\":\"${PASSWORD}\"}}")

HTTP_CODE=$(echo "$RESPONSE" | tail -n 1)
BODY=$(echo "$RESPONSE" | sed '$d')

if [ "$HTTP_CODE" -eq 200 ]; then
  echo "Login successful."
  echo "$BODY" | grep -o '"accessToken":"[^"]*"' | head -n 1
  exit 0
else
  echo "Login failed with HTTP ${HTTP_CODE}."
  echo "$BODY"
  exit 1
fi
