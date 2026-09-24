#!/usr/bin/env bash
set -e

APP_URL=${APP_URL:-"http://127.0.0.1:80"}
USERNAME=${USERNAME:-"testuser"}
PASSWORD=${PASSWORD:-"testpass"}

HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" -X POST "$APP_URL/inlong/manager/api/anno/register" \
  -H "Content-Type: application/json" \
  -d "{\"username\":\"$USERNAME\",\"password\":\"$PASSWORD\",\"accountType\":1}")

if [ "$HTTP_STATUS" -eq 200 ]; then
  echo "Register successful"
  exit 0
else
  echo "Register failed with HTTP status $HTTP_STATUS"
  exit 1
fi
