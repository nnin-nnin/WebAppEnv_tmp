#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18838}"
APP_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-test@liferay.com}}}"
PASSWORD="${ADMIN_PASSWORD:-${APP_PASSWORD:-test}}"

echo "=========================================="
echo "Liferay Portal Multi-Tier Login Verification"
echo "Target URL: ${APP_URL}"
echo "User: ${USERNAME}"
echo "=========================================="

API_PASSED=false
WEB_PASSED=false

# Tier 1: Liferay Core JSON-WS REST API Authentication
echo "[1/2] Checking Liferay Core JSON-WS API authentication..."
API_RESP=$(curl -s -u "${USERNAME}:${PASSWORD}" "${APP_URL}/api/jsonws/user/get-current-user" || true)

if echo "$API_RESP" | grep -q "\"emailAddress\":\"${USERNAME}\""; then
  USER_ID=$(echo "$API_RESP" | grep -o '"userId":"[^"]*"' | head -n1 | cut -d'"' -f4 || echo "20127")
  USER_NAME=$(echo "$API_RESP" | grep -o '"greeting":"[^"]*"' | head -n1 | cut -d'"' -f4 || echo "Test Test")
  echo "✓ Liferay JSON-WS API authenticated successfully!"
  echo "  User ID: ${USER_ID}"
  echo "  Greeting: ${USER_NAME}"
  API_PASSED=true
else
  echo "✗ Liferay JSON-WS API response did not match expected user: ${API_RESP:0:150}..."
fi

# Tier 2: Liferay Web Portal Form Authentication
echo "[2/2] Checking Liferay Web Portal Form authentication..."
TMP_COOKIE=$(mktemp)
TMP_HTML=$(mktemp)
trap 'rm -f "$TMP_COOKIE" "$TMP_HTML"' EXIT

# Fetch initial login page to extract CSRF tokens and action URL
curl -s -c "$TMP_COOKIE" -L "${APP_URL}/c/portal/login" > "$TMP_HTML" 2>&1 || true

ACTION_URL=$(grep -o 'action="[^"]*p_p_id=com_liferay_login_web_portlet_LoginPortlet[^"]*"' "$TMP_HTML" | head -n1 | sed -e 's/action="//' -e 's/"$//' -e 's/&amp;/\&/g' || true)
FORM_DATE=$(grep -o 'name="_com_liferay_login_web_portlet_LoginPortlet_formDate"[^>]*value="[^"]*"' "$TMP_HTML" | head -n1 | grep -o 'value="[^"]*"' | cut -d'"' -f2 || true)

if [ -n "$ACTION_URL" ]; then
  # Submit login form
  POST_DATA="_com_liferay_login_web_portlet_LoginPortlet_formDate=${FORM_DATE}&_com_liferay_login_web_portlet_LoginPortlet_saveLastPath=false&_com_liferay_login_web_portlet_LoginPortlet_redirect=&_com_liferay_login_web_portlet_LoginPortlet_doActionAfterLogin=false&_com_liferay_login_web_portlet_LoginPortlet_login=${USERNAME}&_com_liferay_login_web_portlet_LoginPortlet_password=${PASSWORD}&_com_liferay_login_web_portlet_LoginPortlet_rememberMe=true&_com_liferay_login_web_portlet_LoginPortlet_checkboxNames=rememberMe"
  
  LOGIN_RESULT=$(curl -s -b "$TMP_COOKIE" -c "$TMP_COOKIE" -d "$POST_DATA" -L "$ACTION_URL" || true)

  if grep -q -E '(COMPANY_ID|SCREEN_NAME|USER_UUID)' "$TMP_COOKIE" 2>/dev/null; then
    echo "✓ Liferay Web Portal Form login succeeded! Session cookies verified."
    WEB_PASSED=true
  else
    echo "✗ Web portal login cookies not set."
  fi
else
  echo "✗ Warning: Unable to parse login form action URL."
fi

echo "=========================================="
if [ "$API_PASSED" = "true" ] && [ "$WEB_PASSED" = "true" ]; then
  echo "RESULT: Liferay Portal ALL login tiers PASSED (JSON-WS API + Web Form)!"
  exit 0
elif [ "$API_PASSED" = "true" ] || [ "$WEB_PASSED" = "true" ]; then
  echo "RESULT: Liferay Portal login PASSED (at least one tier verified)."
  exit 0
else
  echo "RESULT: Liferay Portal login verification FAILED."
  exit 1
fi
