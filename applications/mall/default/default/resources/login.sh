#!/usr/bin/env bash
set -euo pipefail
BASE_URL="http://127.0.0.1:18096"

verify_account() {
  local user="$1"
  local pass="$2"
  local expected_role="$3"
  local resp token info_resp
  resp=$(curl -s -X POST "$BASE_URL/admin/login" \
    -H "Content-Type: application/json" \
    -d "{\"username\":\"$user\",\"password\":\"$pass\"}")
  if ! echo "$resp" | grep -q '"code":200'; then
    echo "[FAIL] Login failed for $user: $resp"
    exit 1
  fi
  token=$(echo "$resp" | sed -n 's/.*"token":"\([^"]*\)".*/\1/p')
  info_resp=$(curl -s "$BASE_URL/admin/info" -H "Authorization: Bearer $token")
  if ! echo "$info_resp" | grep -q "\"username\":\"$user\""; then
    echo "[FAIL] /admin/info check failed for $user: $info_resp"
    exit 1
  fi
  if ! echo "$info_resp" | grep -q "$expected_role"; then
    echo "[FAIL] Role check ($expected_role) failed for $user: $info_resp"
    exit 1
  fi
  echo "[OK] Verified account: $user (role=$expected_role)"
}

verify_account "admin" "AdminPassword123!" "超级管理员"
verify_account "admin2" "AdminPassword123!" "超级管理员"
verify_account "user1" "UserPassword123!" "商品管理员"
verify_account "user2" "UserPassword123!" "商品管理员"

bad_resp=$(curl -s -X POST "$BASE_URL/admin/login" -H "Content-Type: application/json" -d '{"username":"admin","password":"WrongPassword!"}')
if echo "$bad_resp" | grep -q '"code":200'; then
  echo "[FAIL] Negative password rejection failed: $bad_resp"
  exit 1
fi
echo "[OK] Negative test passed (wrong password rejected)"
echo "[SUCCESS] All 4 accounts (admin, admin2, user1, user2) verified successfully!"
