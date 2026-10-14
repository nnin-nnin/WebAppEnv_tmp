#!/usr/bin/env bash
set -euo pipefail
BASE_URL="http://127.0.0.1:18098"

verify_account() {
  local user="$1"
  local pass="$2"
  local expected_type="$3"
  local cookie_file="/tmp/supermarket_cookie_${user}.txt"
  rm -f "$cookie_file"
  local resp ticket state_resp type_resp
  resp=$(curl -s -c "$cookie_file" -X POST "$BASE_URL/manage/login" \
    --data-urlencode "userName=$user" \
    --data-urlencode "userPassword=$pass" \
    --data-urlencode "valistr=1234" \
    --data-urlencode "token=tok_${user}" \
    --data-urlencode "remname=false" \
    --data-urlencode "autologin=false")
  if ! echo "$resp" | grep -q '"status":200'; then
    echo "[FAIL] Login failed for $user: $resp"
    exit 1
  fi
  ticket=$(awk '$6 == "EM_TICKET" {print $7}' "$cookie_file" | tr -d '\r\n')
  if [[ -z "$ticket" ]]; then
    echo "[FAIL] No EM_TICKET cookie set for $user"
    exit 1
  fi
  state_resp=$(curl -s "$BASE_URL/manage/query/$ticket")
  if ! echo "$state_resp" | grep -E -q "userName.?\":.?\"$user"; then
    echo "[FAIL] /manage/query/$ticket check failed for $user: $state_resp"
    exit 1
  fi
  type_resp=$(curl -s "$BASE_URL/query/userType?ticket=$ticket")
  if [[ "$type_resp" != "$expected_type" ]]; then
    echo "[FAIL] /query/userType expected $expected_type, got $type_resp for $user"
    exit 1
  fi
  echo "[OK] Verified account: $user (userType=$type_resp)"
}

verify_account "admin" "AdminPassword123!" "4"
verify_account "admin2" "AdminPassword123!" "4"
verify_account "user1" "UserPassword123!" "1"
verify_account "user2" "UserPassword123!" "1"

bad_resp=$(curl -s -X POST "$BASE_URL/manage/login" \
  --data-urlencode "userName=admin" \
  --data-urlencode "userPassword=WrongPassword!" \
  --data-urlencode "valistr=1234" \
  --data-urlencode "token=tok_bad" \
  --data-urlencode "remname=false" \
  --data-urlencode "autologin=false")
if echo "$bad_resp" | grep -q '"status":200'; then
  echo "[FAIL] Negative password rejection failed: $bad_resp"
  exit 1
fi
echo "[OK] Negative test passed (wrong password rejected)"
echo "[SUCCESS] All 4 accounts (admin, admin2, user1, user2) verified successfully!"
