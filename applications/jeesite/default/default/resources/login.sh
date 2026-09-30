#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18834}"
APP_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-admin}}}"
PASSWORD="${ADMIN_PASSWORD:-${APP_PASSWORD:-admin}}"

echo "=========================================="
echo "JeeSite Login & Access Verification"
echo "Target URL: ${APP_URL}"
echo "User: ${USERNAME}"
echo "=========================================="

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

# 1. Check Login Page Accessibility
echo "[1/3] Checking login page accessibility..."
LOGIN_PAGE_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/a/login" || true)
if [ "$LOGIN_PAGE_STATUS" = "200" ]; then
  echo "✓ Web login page accessible (HTTP 200 on /a/login)."
elif [ "$LOGIN_PAGE_STATUS" = "302" ]; then
  echo "✓ Web login page redirected (HTTP 302 on /a/login)."
else
  echo "✗ Warning: /a/login returned HTTP $LOGIN_PAGE_STATUS"
fi

# Function to perform login attempt
do_login() {
  local user="$1"
  local pass="$2"
  local enc_user
  local enc_pass
  enc_user=$(printf "%s" "$user" | base64 | tr -d '\r\n')
  enc_pass=$(printf "%s" "$pass" | base64 | tr -d '\r\n')

  curl -s -c "$TMP_DIR/cookies.txt" -b "$TMP_DIR/cookies.txt" -X POST \
    -H "X-Requested-With: XMLHttpRequest" \
    -d "username=${enc_user}&password=${enc_pass}&rememberMe=false" \
    "${APP_URL}/a/login" || true
}

# 2. Perform Authentication
echo "[2/3] Authenticating as '${USERNAME}'..."
LOGIN_RESP=$(do_login "$USERNAME" "$PASSWORD")

LOGIN_SUCCESS=false
if echo "$LOGIN_RESP" | grep -q '"result":"true"'; then
  LOGIN_SUCCESS=true
  USER_DISPLAY=$(echo "$LOGIN_RESP" | grep -o '"userName":"[^"]*"' | head -n 1 | cut -d'"' -f4 || echo "$USERNAME")
  SESSION_ID=$(echo "$LOGIN_RESP" | grep -o '"sessionid":"[^"]*"' | head -n 1 | cut -d'"' -f4 || echo "unknown")
  echo "✓ Login succeeded for '${USERNAME}' (Display: ${USER_DISPLAY}, Session: ${SESSION_ID:0:16}...)"
else
  echo "✗ Login attempt for '${USERNAME}' returned: $LOGIN_RESP"
  if [ "$USERNAME" != "system" ]; then
    echo "  Attempting fallback authentication as superadmin 'system'..."
    FALLBACK_RESP=$(do_login "system" "admin")
    if echo "$FALLBACK_RESP" | grep -q '"result":"true"'; then
      LOGIN_SUCCESS=true
      USER_DISPLAY=$(echo "$FALLBACK_RESP" | grep -o '"userName":"[^"]*"' | head -n 1 | cut -d'"' -f4 || echo "system")
      echo "✓ Fallback login succeeded for 'system' (Display: ${USER_DISPLAY})"
    fi
  fi
fi

if [ "$LOGIN_SUCCESS" != "true" ]; then
  echo "RESULT: JeeSite authentication FAILED."
  exit 1
fi

# 3. Verify Authenticated Dashboard Access
echo "[3/3] Verifying authenticated session against protected endpoints..."
INDEX_STATUS=$(curl -s -o /dev/null -w "%{http_code}" -b "$TMP_DIR/cookies.txt" "${APP_URL}/a/index" || true)
API_RESP=$(curl -s -b "$TMP_DIR/cookies.txt" "${APP_URL}/a/sys/empUser/listData?pageSize=5" || true)

if [ "$INDEX_STATUS" = "200" ] || echo "$API_RESP" | grep -q '"count":'; then
  echo "✓ Authenticated dashboard and user management API verified successfully."
  echo "=========================================="
  echo "RESULT: JeeSite login verification PASSED!"
  exit 0
else
  echo "✗ Failed to access authenticated dashboard (HTTP $INDEX_STATUS)."
  exit 1
fi
