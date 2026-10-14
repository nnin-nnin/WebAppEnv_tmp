#!/usr/bin/env bash
set -euo pipefail
BASE_URL="${BASE_URL:-http://127.0.0.1:18101}"

verify_account() {
  local user="$1"
  local pass="$2"
  local expected_flag="$3"
  echo "[*] Verifying account: $user (expected role flagKey=$expected_flag)"
  local resp
  resp=$(curl -s -X POST "$BASE_URL/ucenter/login" \
    -H "Content-Type: application/json" \
    -d "{\"username\":\"$user\",\"password\":\"$pass\"}")
  if ! echo "$resp" | grep -q '"success":true'; then
    echo "[-] Login failed for $user: $resp" >&2
    return 1
  fi
  local token
  token=$(echo "$resp" | sed -n 's/.*"jwt_token":"\([^"]*\)".*/\1/p')
  if [[ -z "$token" ]]; then
    echo "[-] Missing jwt_token for $user: $resp" >&2
    return 1
  fi
  local info
  info=$(curl -s "$BASE_URL/ucenter/getMyInfo" -H "Authorization: Bearer $token")
  if ! echo "$info" | grep -q "\"userName\":\"$user\""; then
    echo "[-] Profile check failed for $user: $info" >&2
    return 1
  fi
  if ! echo "$info" | grep -q "\"flagKey\":\"$expected_flag\""; then
    echo "[-] Role flagKey mismatch for $user: $info" >&2
    return 1
  fi
  echo "[+] Account $user verified (flagKey=$expected_flag)"
}

verify_account "admin" "AdminPassword123!" "admin"
verify_account "admin2" "AdminPassword123!" "admin"
verify_account "user1" "UserPassword123!" "user"
verify_account "user2" "UserPassword123!" "user"

echo "[*] Verifying wrong password rejection..."
bad_resp=$(curl -s -X POST "$BASE_URL/ucenter/login" \
  -H "Content-Type: application/json" \
  -d '{"username":"admin","password":"WrongPassword123!"}')
if echo "$bad_resp" | grep -q '"success":true'; then
  echo "[-] Negative test failed: wrong password accepted!" >&2
  exit 1
fi
echo "[+] Wrong password properly rejected."
echo "[SUCCESS] All 4 accounts (2x2 matrix) in caifeng dynamically verified!"
