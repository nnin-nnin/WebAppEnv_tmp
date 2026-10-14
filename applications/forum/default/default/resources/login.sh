#!/usr/bin/env bash
set -euo pipefail

BASE_URL="${1:-http://127.0.0.1:18091}"
echo "=== Verifying 2x2 Account Matrix for forum ($BASE_URL) ==="

verify_account() {
  local username="$1"
  local password="$2"
  local expected_uid="$3"
  local cookie_jar
  cookie_jar=$(mktemp)
  local headers
  headers=$(mktemp)

  curl -s -D "$headers" -o /dev/null -c "$cookie_jar" -X POST "$BASE_URL/login.do" \
    --data-urlencode "email=$username" \
    --data-urlencode "password=$password"

  if ! grep -qi "Location:.*toMyProfile.do" "$headers"; then
    echo "[FAIL] Login failed for $username (did not redirect to toMyProfile.do)" >&2
    cat "$headers" >&2
    rm -f "$cookie_jar" "$headers"
    return 1
  fi

  local profile_page
  profile_page=$(curl -s -b "$cookie_jar" "$BASE_URL/toMyProfile.do")
  rm -f "$cookie_jar" "$headers"

  if ! echo "$profile_page" | grep -q "$username"; then
    echo "[FAIL] Profile page for $username did not contain expected username" >&2
    return 1
  fi
  echo "[OK] Account '$username' (uid=$expected_uid) logged in and verified /toMyProfile.do."
}

verify_account "admin"  "AdminPassword123!" "13"
verify_account "admin2" "AdminPassword123!" "14"
verify_account "user1"  "UserPassword123!"  "15"
verify_account "user2"  "UserPassword123!"  "16"

bad_headers=$(mktemp)
curl -s -D "$bad_headers" -o /dev/null -X POST "$BASE_URL/login.do" \
  --data-urlencode "email=admin" \
  --data-urlencode "password=WrongPassword999!"
if grep -qi "Location:.*toMyProfile.do" "$bad_headers"; then
  echo "[FAIL] Negative password rejection failed for forum" >&2
  rm -f "$bad_headers"
  exit 1
fi
rm -f "$bad_headers"
echo "[OK] Negative test passed (WrongPassword999! rejected)."
echo "=== ALL 4 ACCOUNTS VERIFIED SUCCESSFULLY ==="
