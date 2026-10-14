#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ENV_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
BASE_URL="http://127.0.0.1:18093"
ORIGIN_HASH="ef301f25d1b8e2bca70fafc1316f1a92"

verify_account() {
  local user="$1"
  local pass="$2"
  local expected_role="$3"

  local vc_resp code_key code_ans login_resp token is_login_resp
  vc_resp=$(curl -s -X POST "$BASE_URL/verifyCode")
  code_key=$(echo "$vc_resp" | sed -n 's/.*"codeKey":"\([^"]*\)".*/\1/p')
  if [[ -z "$code_key" ]]; then
    echo "[FAIL] Failed to obtain verifyCode key for $user"
    exit 1
  fi
  code_ans=$(docker compose -f "$ENV_DIR/docker/compose.yaml" exec -T redis redis-cli --raw eval "local k = redis.call('keys', '*'..ARGV[1]); local v = redis.call('get', k[1]); return string.sub(v, 8)" 0 "$code_key" | tr -d '\r\n')
  login_resp=$(curl -s -X POST "$BASE_URL/user/login" \
    -H "verifyCode: $code_key" \
    -H "usersOrigin: $ORIGIN_HASH" \
    --data-urlencode "data={\"email\":\"$user\",\"password\":\"$pass\",\"verifyCode\":\"$code_ans\"}")
  if ! echo "$login_resp" | grep -q '"info":"登录成功"'; then
    echo "[FAIL] Login failed for $user: $login_resp"
    exit 1
  fi
  if ! echo "$login_resp" | grep -q "\"RoleLevel\":\"$expected_role\""; then
    echo "[FAIL] Role mismatch for $user: $login_resp"
    exit 1
  fi
  token=$(echo "$login_resp" | sed -n 's/.*"token":"\([^"]*\)".*/\1/p')
  is_login_resp=$(curl -s -X POST "$BASE_URL/admin/getUserInfo" -H "Authorization: $token" -H "usersOrigin: $ORIGIN_HASH")
  if ! echo "$is_login_resp" | grep -q "\"username\":\"$user\""; then
    echo "[FAIL] Token verification /admin/getUserInfo failed for $user: $is_login_resp"
    exit 1
  fi
  echo "[OK] Verified account: $user (role=$expected_role)"
}

verify_account "admin" "AdminPassword123!" "admin"
verify_account "admin2" "AdminPassword123!" "admin"
verify_account "user1" "UserPassword123!" "user"
verify_account "user2" "UserPassword123!" "user"

bad_vc=$(curl -s -X POST "$BASE_URL/verifyCode")
bad_key=$(echo "$bad_vc" | sed -n 's/.*"codeKey":"\([^"]*\)".*/\1/p')
bad_ans=$(docker compose -f "$ENV_DIR/docker/compose.yaml" exec -T redis redis-cli --raw eval "local k = redis.call('keys', '*'..ARGV[1]); local v = redis.call('get', k[1]); return string.sub(v, 8)" 0 "$bad_key" | tr -d '\r\n')
bad_resp=$(curl -s -X POST "$BASE_URL/user/login" -H "verifyCode: $bad_key" -H "usersOrigin: $ORIGIN_HASH" --data-urlencode "data={\"email\":\"admin\",\"password\":\"WrongPassword999!\",\"verifyCode\":\"$bad_ans\"}")
if echo "$bad_resp" | grep -q '"info":"登录成功"'; then
  echo "[FAIL] Negative password rejection failed for Tbed: $bad_resp"
  exit 1
fi
echo "[OK] Negative test passed (WrongPassword999! rejected)"
echo "[SUCCESS] All 4 accounts (admin, admin2, user1, user2) verified successfully!"
