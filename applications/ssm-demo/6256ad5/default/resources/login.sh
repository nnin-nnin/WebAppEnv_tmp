#!/usr/bin/env bash
set -euo pipefail
BASE_URL="http://127.0.0.1:18092"

verify_admin() {
  local user="$1"
  local pass="$2"
  local cookie_file="/tmp/ssmdemo_cookie_${user}.txt"
  rm -f "$cookie_file"
  local resp
  resp=$(curl -s -c "$cookie_file" -b "$cookie_file" -X POST "$BASE_URL/loginAdmin.action" \
    --data-urlencode "username=$user" \
    --data-urlencode "password=$pass")
  if ! echo "$resp" | grep -q "欢迎管理员"; then
    echo "[FAIL] Admin login failed for $user"
    exit 1
  fi
  echo "[OK] Verified administrator account: $user"
}

verify_user() {
  local user="$1"
  local pass="$2"
  local nick="$3"
  local cookie_file="/tmp/ssmdemo_cookie_${user}.txt"
  rm -f "$cookie_file"
  curl -s -L -c "$cookie_file" -b "$cookie_file" -X POST "$BASE_URL/loginUser.action" \
    --data-urlencode "userCustom.username=$user" \
    --data-urlencode "userCustom.password=$pass" >/dev/null
  local profile
  profile=$(curl -s -b "$cookie_file" "$BASE_URL/queryMinePage.action?pageNo=1")
  if ! echo "$profile" | grep -q "$nick"; then
    echo "[FAIL] Standard user login/profile verification failed for $user"
    exit 1
  fi
  echo "[OK] Verified standard_user account: $user ($nick)"
}

verify_admin "admin" "AdminPassword123!"
verify_admin "admin2" "AdminPassword123!"
verify_user "user1" "UserPassword123!" "user1_nick"
verify_user "user2" "UserPassword123!" "user2_nick"

bad_resp=$(curl -s -X POST "$BASE_URL/loginAdmin.action" --data-urlencode "username=admin" --data-urlencode "password=WrongPassword999!")
if echo "$bad_resp" | grep -q "欢迎管理员"; then
  echo "[FAIL] Negative password rejection failed for ssm-demo"
  exit 1
fi
echo "[OK] Negative test passed (WrongPassword999! rejected)"
echo "[SUCCESS] All 4 accounts (admin, admin2, user1, user2) verified successfully!"
