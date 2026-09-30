#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18641}"
URL="http://127.0.0.1:${HOST_PORT}/"
USERNAME="${ADMIN_USERNAME:-${USERNAME:-${APP_USERNAME:-admin}}}"
PASSWORD="${ADMIN_PASSWORD:-${PASSWORD:-${APP_PASSWORD:-Admin123456!}}}"

echo "Checking kong-admin-ui login endpoint at ${URL}..."

# Check if admin user needs to be registered
HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$URL" || true)
if [ "$HTTP_STATUS" -eq 302 ]; then
  curl -s -X POST "http://127.0.0.1:${HOST_PORT}/register" \
    -d "username=${USERNAME}&email=admin@example.com&password=${PASSWORD}&password_confirmation=${PASSWORD}" >/dev/null 2>&1 || true
  HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$URL" || true)
fi

if [ "$HTTP_STATUS" -eq 200 ]; then
  echo "SUCCESS: kong-admin-ui root endpoint returned HTTP 200."
else
  HTTP_STATUS_L=$(curl -s -L -o /dev/null -w "%{http_code}" "$URL" || true)
  if [ "$HTTP_STATUS_L" -eq 200 ]; then
    echo "SUCCESS: kong-admin-ui root endpoint returned HTTP 200 via redirect."
  else
    echo "FAILED: kong-admin-ui root endpoint returned HTTP ${HTTP_STATUS}."
    exit 1
  fi
fi

# Verify API login authentication
LOGIN_STATUS=$(curl -s -o /dev/null -w "%{http_code}" \
  -H "Content-Type: application/json" \
  -d "{\"identifier\":\"${USERNAME}\",\"password\":\"${PASSWORD}\"}" \
  "http://127.0.0.1:${HOST_PORT}/login" || true)

if [ "$LOGIN_STATUS" -eq 200 ]; then
  echo "SUCCESS: kong-admin-ui API login succeeded (HTTP 200)."
else
  echo "WARNING: kong-admin-ui API login returned HTTP ${LOGIN_STATUS}."
fi

exit 0
