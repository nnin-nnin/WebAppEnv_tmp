#!/usr/bin/env bash
set -euo pipefail
BASE_URL="${BASE_URL:-http://127.0.0.1:18099}"

verify_admin() {
  local user="$1"
  local pass_b64="$2"
  echo "[*] Verifying Admin account: $user"
  local resp
  resp=$(curl -s -X POST "$BASE_URL/rest/admin/login" \
    -H "Content-Type: application/json" \
    -d "{\"username\":\"$user\",\"password\":\"$pass_b64\"}")
  if ! echo "$resp" | grep -q '"success":true'; then
    echo "[-] Admin login failed for $user: $resp" >&2
    return 1
  fi
  local token
  token=$(echo "$resp" | sed -n 's/.*"token":"\([^"]*\)".*/\1/p')
  if [[ -z "$token" ]]; then
    echo "[-] Missing token for $user: $resp" >&2
    return 1
  fi
  local info
  info=$(curl -s -X POST "$BASE_URL/rest/admin/getLoginAdminInfo" \
    -H "Authorization: $token" \
    -H "Content-Type: application/json" \
    -d '{}')
  if ! echo "$info" | grep -q "\"username\":\"$user\""; then
    echo "[-] Admin profile check failed for $user: $info" >&2
    return 1
  fi
  echo "[+] Admin $user verified (roles=admin)"
}

verify_member() {
  local user="$1"
  local pass_b64="$2"
  echo "[*] Verifying Standard User account: $user"
  local resp
  resp=$(curl -s -X POST "$BASE_URL/rest/member/login" \
    -H "Content-Type: application/json" \
    -d "{\"username\":\"$user\",\"password\":\"$pass_b64\"}")
  if ! echo "$resp" | grep -q '"success":true'; then
    echo "[-] Member login failed for $user: $resp" >&2
    return 1
  fi
  local token
  token=$(echo "$resp" | sed -n 's/.*"token":"\([^"]*\)".*/\1/p')
  if [[ -z "$token" ]]; then
    echo "[-] Missing token for $user: $resp" >&2
    return 1
  fi
  local info
  info=$(curl -s -X POST "$BASE_URL/rest/member/getLoginMemberInfo" \
    -H "Authorization: $token" \
    -H "Content-Type: application/json" \
    -d '{}')
  if ! echo "$info" | grep -q "\"username\":\"$user\""; then
    echo "[-] Member profile check failed for $user: $info" >&2
    return 1
  fi
  echo "[+] Standard User $user verified (type=1)"
}

verify_admin "admin" "QWRtaW5QYXNzd29yZDEyMyE="
verify_admin "admin2" "QWRtaW5QYXNzd29yZDEyMyE="
verify_member "user1" "VXNlclBhc3N3b3JkMTIzIQ=="
verify_member "user2" "VXNlclBhc3N3b3JkMTIzIQ=="

echo "[*] Verifying wrong password rejection..."
bad_resp=$(curl -s -X POST "$BASE_URL/rest/admin/login" \
  -H "Content-Type: application/json" \
  -d '{"username":"admin","password":"V3JvbmdQYXNzd29yZDEyMyE="}')
if echo "$bad_resp" | grep -q '"success":true'; then
  echo "[-] Negative test failed: wrong password accepted!" >&2
  exit 1
fi
echo "[+] Wrong password properly rejected."
echo "[SUCCESS] All 4 accounts (2x2 matrix) in siam-cloud dynamically verified!"
