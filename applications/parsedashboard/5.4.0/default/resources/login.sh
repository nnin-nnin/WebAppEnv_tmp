#!/usr/bin/env bash
set -e

HOST_PORT="${HOST_PORT:-18592}"
BASE_URL="http://127.0.0.1:${HOST_PORT}"
USERNAME="${ADMIN_USERNAME:-${USERNAME:-${APP_USERNAME:-admin}}}"
PASSWORD="${ADMIN_PASSWORD:-${PASSWORD:-${APP_PASSWORD:-AdminPassword123!}}}"

COOKIE_FILE=$(mktemp)
LOGIN_PAGE=$(mktemp)

cleanup() {
  rm -f "$COOKIE_FILE" "$LOGIN_PAGE"
}
trap cleanup EXIT

echo "Checking Parse Dashboard login page at ${BASE_URL}/login..."
HTTP_STATUS=$(curl -s -c "$COOKIE_FILE" -w "%{http_code}" -o "$LOGIN_PAGE" "${BASE_URL}/login" || true)

if [ "$HTTP_STATUS" != "200" ]; then
  echo "FAILED: /login returned HTTP ${HTTP_STATUS}"
  exit 1
fi

CSRF_TOKEN=$(grep -o '<script id="csrf"[^>]*>[^<]*' "$LOGIN_PAGE" | sed 's/.*"\(.*\)".*/\1/')
if [ -z "$CSRF_TOKEN" ]; then
  echo "FAILED: Could not extract CSRF token from login page."
  exit 1
fi

echo "Attempting login for user '${USERNAME}'..."
POST_STATUS=$(curl -s -b "$COOKIE_FILE" -c "$COOKIE_FILE" -o /dev/null -w "%{http_code}" \
  -d "username=${USERNAME}&password=${PASSWORD}&_csrf=${CSRF_TOKEN}" \
  "${BASE_URL}/login")

if [ "$POST_STATUS" != "302" ] && [ "$POST_STATUS" != "200" ]; then
  echo "FAILED: Login POST returned HTTP ${POST_STATUS}"
  exit 1
fi

# Verify authenticated session by accessing /apps
APPS_STATUS=$(curl -s -b "$COOKIE_FILE" -o /dev/null -w "%{http_code}" "${BASE_URL}/apps")
if [ "$APPS_STATUS" -eq 200 ]; then
  echo "SUCCESS: Parse Dashboard login verified and authenticated session confirmed (HTTP 200)."
  exit 0
else
  echo "FAILED: Access to /apps returned HTTP ${APPS_STATUS} after login."
  exit 1
fi
