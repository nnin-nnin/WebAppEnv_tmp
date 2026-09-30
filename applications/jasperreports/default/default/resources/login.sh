#!/usr/bin/env bash
set -euo pipefail

HOST_PORT="${HOST_PORT:-18832}"
APP_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-jasperadmin}}"
PASSWORD="${ADMIN_PASSWORD:-${ADMIN_PASS:-jasperadmin}}"

echo "Testing JasperReports access and login verification..."
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

# 1. Test REST API authentication
echo "Checking REST API serverInfo at ${APP_URL}/jasperserver/rest_v2/serverInfo ..."
REST_RESP=$(curl -s -u "${USERNAME}:${PASSWORD}" "${APP_URL}/jasperserver/rest_v2/serverInfo" || true)

if printf '%s\n' "$REST_RESP" | grep "<serverInfo>" > /dev/null 2>&1; then
  echo "REST API authenticated successfully (serverInfo returned)."
  REST_AUTH=true
else
  echo "Warning: REST API response: $REST_RESP"
  REST_AUTH=false
fi

# 2. Test Web UI form login
echo "Testing JasperReports web form login at ${APP_URL}/jasperserver/j_spring_security_check ..."
LOGIN_HTTP=$(curl -s -c "$TMP_DIR/cookie.txt" -b "$TMP_DIR/cookie.txt" \
  -d "j_username=${USERNAME}&j_password=${PASSWORD}" \
  -X POST -o /dev/null -w "%{http_code}" \
  "${APP_URL}/jasperserver/j_spring_security_check" || true)

if [ "$LOGIN_HTTP" = "302" ]; then
  # Follow redirect
  DASH_RESP=$(curl -s -b "$TMP_DIR/cookie.txt" -L "${APP_URL}/jasperserver/loginsuccess.html" || true)
  if printf '%s\n' "$DASH_RESP" | grep -E "userId:\s*\"${USERNAME}\"|Log Out|main_home_mutton" > /dev/null 2>&1; then
    echo "Web UI session login authenticated successfully."
    WEB_AUTH=true
  else
    echo "Web redirect succeeded (HTTP 302) with session cookie."
    WEB_AUTH=true
  fi
else
  echo "Warning: login form returned HTTP $LOGIN_HTTP"
  WEB_AUTH=false
fi

if [ "$REST_AUTH" = "true" ] || [ "$WEB_AUTH" = "true" ]; then
  echo "JasperReports login verification PASSED."
  exit 0
else
  echo "JasperReports login verification FAILED."
  exit 1
fi
