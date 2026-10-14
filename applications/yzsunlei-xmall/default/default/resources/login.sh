#!/usr/bin/env bash
set -euo pipefail
BASE_URL="http://127.0.0.1:18097"

verify_account() {
  local user="$1"
  local pass="$2"
  local admin_id="$3"
  local expected_role_id="$4"
  local resp token info_resp role_resp
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
  role_resp=$(curl -s "$BASE_URL/admin/role/$admin_id" -H "Authorization: Bearer $token")
  if ! echo "$role_resp" | grep -q "\"id\":$expected_role_id"; then
    echo "[FAIL] /admin/role/$admin_id check failed for $user: $role_resp"
    exit 1
  fi
  echo "[OK] Verified account: $user (role_id=$expected_role_id)"
}

verify_account "admin" "AdminPassword123!" "101" "1"
verify_account "admin2" "AdminPassword123!" "102" "1"
verify_account "user1" "UserPassword123!" "103" "2"
verify_account "user2" "UserPassword123!" "104" "2"

bad_resp=$(curl -s -X POST "$BASE_URL/admin/login" -H "Content-Type: application/json" -d '{"username":"admin","password":"WrongPassword!"}')
if echo "$bad_resp" | grep -q '"code":200'; then
  echo "[FAIL] Negative password rejection failed: $bad_resp"
  exit 1
fi
echo "[OK] Negative test passed (wrong password rejected)"
echo "[SUCCESS] All 4 accounts (admin, admin2, user1, user2) verified successfully!"
