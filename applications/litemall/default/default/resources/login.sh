#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18087}"
APP_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"

echo "=========================================="
echo "litemall Multi-Tier Login Verification"
echo "Target URL: ${APP_URL}"
echo "=========================================="

test_admin_login() {
  local USERNAME="$1"
  local PASSWORD="$2"
  local ROLE="$3"

  echo "------------------------------------------"
  echo "Testing Admin Account: ${USERNAME} (${ROLE})"

  local PAYLOAD="{\"username\":\"${USERNAME}\",\"password\":\"${PASSWORD}\"}"
  local RESP
  RESP=$(curl -s -X POST -H "Content-Type: application/json" -d "$PAYLOAD" "${APP_URL}/admin/auth/login" || true)

  if ! echo "$RESP" | grep -q '"errno":0'; then
    echo "✗ Admin login failed for ${USERNAME}: ${RESP}"
    return 1
  fi

  local TOKEN
  TOKEN=$(echo "$RESP" | grep -o '"token":"[^"]*"' | cut -d'"' -f4)
  echo "✓ Admin authenticated successfully! Token: ${TOKEN:0:20}..."

  # Verify token against /admin/auth/info
  local INFO_RESP
  INFO_RESP=$(curl -s -H "X-Litemall-Admin-Token: ${TOKEN}" "${APP_URL}/admin/auth/info" || true)
  if echo "$INFO_RESP" | grep -q '"errno":0'; then
    local NICK
    NICK=$(echo "$INFO_RESP" | grep -o '"name":"[^"]*"' | cut -d'"' -f4 || echo "$USERNAME")
    local ROLES
    ROLES=$(echo "$INFO_RESP" | grep -o '"roles":\[[^]]*\]' || echo "[]")
    echo "✓ Session verified for ${NICK} with roles: ${ROLES}"
    return 0
  else
    echo "✗ Admin info validation failed: ${INFO_RESP}"
    return 1
  fi
}

test_user_login() {
  local USERNAME="$1"
  local PASSWORD="$2"
  local ROLE="$3"

  echo "------------------------------------------"
  echo "Testing User Account: ${USERNAME} (${ROLE})"

  local PAYLOAD="{\"username\":\"${USERNAME}\",\"password\":\"${PASSWORD}\"}"
  local RESP
  RESP=$(curl -s -X POST -H "Content-Type: application/json" -d "$PAYLOAD" "${APP_URL}/wx/auth/login" || true)

  if ! echo "$RESP" | grep -q '"errno":0'; then
    echo "✗ User login failed for ${USERNAME}: ${RESP}"
    return 1
  fi

  local TOKEN
  TOKEN=$(echo "$RESP" | grep -o '"token":"[^"]*"' | cut -d'"' -f4)
  echo "✓ User authenticated successfully! Token: ${TOKEN:0:20}..."

  # Verify token against user index or user info
  local USER_RESP
  USER_RESP=$(curl -s -H "X-Litemall-Token: ${TOKEN}" "${APP_URL}/wx/user/index" || true)
  if echo "$USER_RESP" | grep -q '"errno":0'; then
    echo "✓ User session verified via /wx/user/index"
    return 0
  else
    echo "✗ User session verification failed: ${USER_RESP}"
    return 1
  fi
}

# 1. Check API endpoint availability
echo "[1] Checking litemall endpoint availability..."
KAPTCHA_RESP=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/admin/auth/kaptcha" || true)
WX_RESP=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/wx/index/index" || true)
echo "✓ Admin kaptcha HTTP ${KAPTCHA_RESP}, WX index HTTP ${WX_RESP}"

if [ $# -ge 2 ]; then
  if [ "${3:-}" = "admin" ] || [ "${1}" = "admin" ] || [ "${1}" = "admin2" ]; then
    test_admin_login "$1" "$2" "${3:-admin}"
  else
    test_user_login "$1" "$2" "${3:-user}"
  fi
  echo "=========================================="
  echo "Single account verification completed."
  exit 0
fi

# 2. Verify all 4 accounts
ALL_PASSED=true

if ! test_admin_login "admin" "AdminPassword123!" "Administrator(Primary)"; then
  ALL_PASSED=false
fi

if ! test_admin_login "admin2" "AdminPassword123!" "Administrator(Peer)"; then
  ALL_PASSED=false
fi

if ! test_user_login "user1" "UserPassword123!" "StandardUser(User1)"; then
  ALL_PASSED=false
fi

if ! test_user_login "user2" "UserPassword123!" "StandardUser(User2)"; then
  ALL_PASSED=false
fi

echo "------------------------------------------"
echo "Testing Negative Password Rejection (WrongPassword999!)"
BAD_RESP=$(curl -s -X POST -H "Content-Type: application/json" -d '{"username":"admin","password":"WrongPassword999!"}' "${APP_URL}/admin/auth/login" || true)
if echo "$BAD_RESP" | grep -q '"errno":0'; then
  echo "✗ Negative test failed: WrongPassword999! was accepted!"
  ALL_PASSED=false
else
  echo "✓ WrongPassword999! properly rejected."
fi

echo "=========================================="
if [ "$ALL_PASSED" = "true" ]; then
  echo "RESULT: All 4 accounts verified successfully in litemall!"
  exit 0
else
  echo "RESULT: One or more accounts failed verification."
  exit 1
fi
