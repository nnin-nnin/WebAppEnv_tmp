#!/usr/bin/env bash
set -euo pipefail
BASE_URL="http://127.0.0.1:18095"

verify_admin() {
  local user="$1"
  local pass="$2"
  local cookie_file="/tmp/flycms_cookie_${user}.txt"
  rm -f "$cookie_file"
  local resp info
  resp=$(curl -s -c "$cookie_file" -b "$cookie_file" -X POST "$BASE_URL/api/auth/login" \
    --data-urlencode "admin_name=$user" \
    --data-urlencode "password=$pass")
  if ! echo "$resp" | grep -q '"code":0'; then
    echo "[FAIL] Admin login failed for $user: $resp"
    exit 1
  fi
  info=$(curl -s -b "$cookie_file" "$BASE_URL/api/user/info")
  if ! echo "$info" | grep -q "\"username\":\"$user\""; then
    echo "[FAIL] Admin /api/user/info verification failed for $user: $info"
    exit 1
  fi
  echo "[OK] Verified administrator account: $user"
}

verify_user() {
  local user="$1"
  local pass="$2"
  local nick="$3"
  local cookie_file="/tmp/flycms_cookie_${user}.txt"
  rm -f "$cookie_file"
  local resp account_page
  resp=$(curl -s -c "$cookie_file" -b "$cookie_file" -X POST "$BASE_URL/ucenter/login_act" \
    --data-urlencode "username=$user" \
    --data-urlencode "password=$pass")
  if ! echo "$resp" | grep -q "操作成功"; then
    echo "[FAIL] Standard user login failed for $user: $resp"
    exit 1
  fi
  account_page=$(curl -s -b "$cookie_file" "$BASE_URL/ucenter/account")
  if ! echo "$account_page" | grep -q "$nick"; then
    echo "[FAIL] Standard user /ucenter/account verification failed for $user"
    exit 1
  fi
  echo "[OK] Verified standard_user account: $user ($nick)"
}

verify_admin "admin" "AdminPassword123!"
verify_admin "admin2" "AdminPassword123!"
verify_user "user1" "UserPassword123!" "user1_nick"
verify_user "user2" "UserPassword123!" "user2_nick"

bad_resp=$(curl -s -X POST "$BASE_URL/api/auth/login" --data-urlencode "admin_name=admin" --data-urlencode "password=WrongPassword999!")
if echo "$bad_resp" | grep -q '"code":0'; then
  echo "[FAIL] Negative password rejection failed for FlyCms: $bad_resp"
  exit 1
fi
echo "[OK] Negative test passed (WrongPassword999! rejected)"
echo "[SUCCESS] All 4 accounts (admin, admin2, user1, user2) verified successfully!"
