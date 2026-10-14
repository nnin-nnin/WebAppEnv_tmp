#!/usr/bin/env bash
set -euo pipefail
BASE_URL="${BASE_URL:-http://127.0.0.1:18100}"

verify_account() {
  local user="$1"
  local pass="$2"
  local expected_emp="$3"
  echo "[*] Verifying account: $user (expected employee=$expected_emp)"
  local resp
  resp=$(curl -s --get "$BASE_URL/user/validate-login" \
    --data-urlencode "loginName=$user" --data-urlencode "username=$user" \
    --data-urlencode "password=$pass" \
    --data-urlencode "loginIp=127.0.0.1")
  if [[ "$resp" != "SUCCESS" && "$resp" != "\"SUCCESS\"" ]]; then
    echo "[-] Login failed for $user: $resp" >&2
    return 1
  fi
  local info
  info=$(curl -s --get "$BASE_URL/user/account/user-name" --data-urlencode "loginName=$user" --data-urlencode "username=$user")
  if ! echo "$info" | grep -q "\"username\":\"$user\""; then
    echo "[-] Account info check failed for $user: $info" >&2
    return 1
  fi
  if ! echo "$info" | grep -q "\"employee\":$expected_emp"; then
    echo "[-] Role/employee flag mismatch for $user: $info" >&2
    return 1
  fi
  echo "[+] Account $user verified (employee=$expected_emp)"
}

verify_account "admin" "AdminPassword123!" "true"
verify_account "admin2" "AdminPassword123!" "true"
verify_account "user1" "UserPassword123!" "false"
verify_account "user2" "UserPassword123!" "false"

echo "[*] Verifying wrong password rejection..."
bad_resp=$(curl -s --get "$BASE_URL/user/validate-login" \
  --data-urlencode "loginName=admin" --data-urlencode "username=admin" \
  --data-urlencode "password=WrongPassword123!" \
  --data-urlencode "loginIp=127.0.0.1")
if [[ "$bad_resp" == "SUCCESS" || "$bad_resp" == "\"SUCCESS\"" ]]; then
  echo "[-] Negative test failed: wrong password accepted!" >&2
  exit 1
fi
echo "[+] Wrong password properly rejected ($bad_resp)."
echo "[SUCCESS] All 4 accounts (2x2 matrix) in weixin-shop-spring-cloud dynamically verified!"
