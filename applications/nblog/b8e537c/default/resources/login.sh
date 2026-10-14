#!/usr/bin/env bash
set -euo pipefail
BASE_URL="http://127.0.0.1:18094"

verify_account() {
  local user="$1"
  local pass="$2"
  local expected_role="$3"

  local resp token blogs_resp
  resp=$(curl -s -X POST "$BASE_URL/admin/login" \
    -H "Content-Type: application/json" \
    -d "{\"username\":\"$user\",\"password\":\"$pass\"}")
  if ! echo "$resp" | grep -q '"code":200'; then
    echo "[FAIL] Login failed for $user: $resp"
    exit 1
  fi
  if ! echo "$resp" | grep -q "\"username\":\"$user\""; then
    echo "[FAIL] Username mismatch in response for $user: $resp"
    exit 1
  fi
  if ! echo "$resp" | grep -q "\"role\":\"$expected_role\""; then
    echo "[FAIL] Role mismatch for $user: $resp"
    exit 1
  fi
  token=$(echo "$resp" | sed -n 's/.*"token":"\([^"]*\)".*/\1/p')
  blogs_resp=$(curl -s "$BASE_URL/admin/blogs?pageNum=1&pageSize=10" -H "Authorization: $token")
  if ! echo "$blogs_resp" | grep -q '"code":200'; then
    echo "[FAIL] Authenticated /admin/blogs check failed for $user: $blogs_resp"
    exit 1
  fi
  echo "[OK] Verified account: $user (role=$expected_role)"
}

verify_account "admin" "AdminPassword123!" "ROLE_admin"
verify_account "admin2" "AdminPassword123!" "ROLE_admin"
verify_account "user1" "UserPassword123!" "ROLE_visitor"
verify_account "user2" "UserPassword123!" "ROLE_visitor"

bad_resp=$(curl -s -X POST "$BASE_URL/admin/login" -H "Content-Type: application/json" -d '{"username":"admin","password":"WrongPassword999!"}')
if echo "$bad_resp" | grep -q '"code":200'; then
  echo "[FAIL] Negative password rejection failed for NBlog: $bad_resp"
  exit 1
fi
echo "[OK] Negative test passed (WrongPassword999! rejected)"
echo "[SUCCESS] All 4 accounts (admin, admin2, user1, user2) verified successfully!"
