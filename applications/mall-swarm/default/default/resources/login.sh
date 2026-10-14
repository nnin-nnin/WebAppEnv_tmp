#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18088}"
APP_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"

echo "=========================================="
echo "mall-swarm Multi-Tier Login Verification"
echo "Target URL: ${APP_URL}"
echo "=========================================="

test_user_login() {
  local USERNAME="$1"
  local PASSWORD="$2"
  local ROLE="$3"

  echo "------------------------------------------"
  echo "Testing Account: ${USERNAME} (${ROLE})"

  # 1. API Direct Authentication (/admin/login)
  local LOGIN_PAYLOAD="{\"username\":\"${USERNAME}\",\"password\":\"${PASSWORD}\"}"
  local LOGIN_RESP
  LOGIN_RESP=$(curl -s -X POST -H "Content-Type: application/json" -d "$LOGIN_PAYLOAD" "${APP_URL}/admin/login" || true)

  if ! echo "$LOGIN_RESP" | grep -q '"code":200'; then
    echo "✗ Login failed for ${USERNAME}: ${LOGIN_RESP}"
    return 1
  fi

  local TOKEN
  TOKEN=$(echo "$LOGIN_RESP" | grep -o '"token":"[^"]*"' | cut -d'"' -f4)
  local TOKEN_HEAD
  TOKEN_HEAD=$(echo "$LOGIN_RESP" | grep -o '"tokenHead":"[^"]*"' | cut -d'"' -f4 || echo "Bearer ")
  echo "✓ Authenticated successfully! Token: ${TOKEN:0:20}..."

  # 2. Authenticated Session Validation (/admin/info)
  local INFO_RESP
  INFO_RESP=$(curl -s -H "Authorization: ${TOKEN_HEAD}${TOKEN}" "${APP_URL}/admin/info" || true)
  if echo "$INFO_RESP" | grep -q '"code":200'; then
    local ADMIN_NAME
    ADMIN_NAME=$(echo "$INFO_RESP" | grep -o '"username":"[^"]*"' | cut -d'"' -f4 || echo "$USERNAME")
    local ROLES
    ROLES=$(echo "$INFO_RESP" | grep -o '"roles":\[[^]]*\]' || echo "[]")
    echo "✓ Session valid for ${ADMIN_NAME} with roles: ${ROLES}"
    return 0
  else
    echo "✗ /admin/info failed: ${INFO_RESP}"
    return 1
  fi
}

# Check API availability
echo "[1] Checking Swagger / Actuator health..."
SWAGGER_HTTP=$(curl -s -L -o /dev/null -w "%{http_code}" "${APP_URL}/swagger-ui.html" || true)
echo "✓ Swagger UI returned HTTP ${SWAGGER_HTTP}"

if [ $# -ge 2 ]; then
  test_user_login "$1" "$2" "${3:-custom}"
  echo "=========================================="
  echo "Single account verification completed."
  exit 0
fi

# Verify 4-account matrix
ACCOUNTS=(
  "admin:AdminPassword123!:Administrator(Super)"
  "admin2:AdminPassword123!:Administrator(Peer)"
  "user1:UserPassword123!:StandardUser(User1)"
  "user2:UserPassword123!:StandardUser(User2)"
)

ALL_PASSED=true
for item in "${ACCOUNTS[@]}"; do
  IFS=":" read -r user pass role <<< "$item"
  if ! test_user_login "$user" "$pass" "$role"; then
    ALL_PASSED=false
  fi
done

echo "------------------------------------------"
echo "Testing Negative Password Rejection (WrongPassword999!)"
BAD_RESP=$(curl -s -X POST -H "Content-Type: application/json" -d '{"username":"admin","password":"WrongPassword999!"}' "${APP_URL}/admin/login" || true)
if echo "$BAD_RESP" | grep -q '"code":200'; then
  echo "✗ Negative test failed: WrongPassword999! was accepted!"
  ALL_PASSED=false
else
  echo "✓ WrongPassword999! properly rejected."
fi

echo "=========================================="
if [ "$ALL_PASSED" = "true" ]; then
  echo "RESULT: All 4 accounts verified successfully in mall-swarm!"
  exit 0
else
  echo "RESULT: One or more accounts failed verification."
  exit 1
fi
