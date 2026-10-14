#!/usr/bin/env bash
set -euo pipefail

BASE_URL="${1:-http://127.0.0.1:18089/ho-api}"
echo "=== Verifying 2x2 Account Matrix for hotel ($BASE_URL) ==="

verify_admin() {
  local username="$1"
  local password="$2"
  local cookie_jar
  cookie_jar=$(mktemp)
  local resp
  resp=$(curl -s -c "$cookie_jar" -X POST "$BASE_URL/login/admin" \
    --data-urlencode "username=$username" \
    --data-urlencode "password=$password")
  if ! echo "$resp" | grep -q '"code":1000' || ! echo "$resp" | grep -q '"sessionId"'; then
    echo "[FAIL] Admin login failed for $username: $resp" >&2
    rm -f "$cookie_jar"
    return 1
  fi
  # Verify admin-protected endpoint (/admin/operator requires role=admin in session)
  local op_resp
  op_resp=$(curl -s -b "$cookie_jar" -X POST "$BASE_URL/admin/operator")
  rm -f "$cookie_jar"
  if ! echo "$op_resp" | grep -q '"code":1000'; then
    echo "[FAIL] Admin session check (/admin/operator) failed for $username: $op_resp" >&2
    return 1
  fi
  echo "[OK] Admin account '$username' logged in and verified /admin/operator access."
}

verify_user() {
  local username="$1"
  local password="$2"
  local expected_uid="$3"
  local cookie_jar
  cookie_jar=$(mktemp)
  local resp
  resp=$(curl -s -c "$cookie_jar" -X POST "$BASE_URL/login/user" \
    --data-urlencode "username=$username" \
    --data-urlencode "password=$password")
  if ! echo "$resp" | grep -q '"code":1000' || ! echo "$resp" | grep -q "\"userId\":$expected_uid"; then
    echo "[FAIL] User login failed for $username: $resp" >&2
    rm -f "$cookie_jar"
    return 1
  fi
  # Verify user profile endpoint (/user/profile requires user session)
  local prof_resp
  prof_resp=$(curl -s -b "$cookie_jar" -X POST "$BASE_URL/user/profile")
  rm -f "$cookie_jar"
  if ! echo "$prof_resp" | grep -q '"code":1000' || ! echo "$prof_resp" | grep -q "\"username\":\"$username\""; then
    echo "[FAIL] User profile check (/user/profile) failed for $username: $prof_resp" >&2
    return 1
  fi
  echo "[OK] Standard user '$username' (userId=$expected_uid) logged in and verified /user/profile."
}

verify_admin "admin" "AdminPassword123!"
verify_admin "admin2" "AdminPassword123!"
verify_user "user1" "UserPassword123!" "13"
verify_user "user2" "UserPassword123!" "14"

bad_resp=$(curl -s -X POST "$BASE_URL/login/admin" --data-urlencode "username=admin" --data-urlencode "password=WrongPassword999!")
if echo "$bad_resp" | grep -q '"code":1000'; then
  echo "[FAIL] Negative password rejection failed: $bad_resp" >&2
  exit 1
fi
echo "[OK] Negative test passed (WrongPassword999! rejected)."
echo "=== ALL 4 ACCOUNTS VERIFIED SUCCESSFULLY ==="
