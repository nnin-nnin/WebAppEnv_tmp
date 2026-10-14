#!/usr/bin/env bash
set -euo pipefail

BASE_URL="${1:-http://127.0.0.1:18090}"
echo "=== Verifying 2x2 Account Matrix for spring-boot-forum ($BASE_URL) ==="

verify_account() {
  local username="$1"
  local password="$2"
  local role_label="$3"
  local cookie_jar
  cookie_jar=$(mktemp)
  local headers
  headers=$(mktemp)

  curl -s -D "$headers" -o /dev/null -c "$cookie_jar" -X POST "$BASE_URL/user/login" \
    --data-urlencode "username=$username" \
    --data-urlencode "password=$password"

  if grep -qi "Location:.*/user/login?error" "$headers"; then
    echo "[FAIL] Login rejected for $username ($role_label)" >&2
    rm -f "$cookie_jar" "$headers"
    return 1
  fi

  local settings_page
  settings_page=$(curl -s -b "$cookie_jar" "$BASE_URL/user/settings")
  rm -f "$cookie_jar" "$headers"

  if ! echo "$settings_page" | grep -q "$username"; then
    echo "[FAIL] Authenticated /user/settings page did not contain username '$username'" >&2
    return 1
  fi
  echo "[OK] Account '$username' ($role_label) logged in and verified /user/settings."
}

verify_account "admin"  "AdminPassword123!" "administrator"
verify_account "admin2" "AdminPassword123!" "administrator"
verify_account "user1"  "UserPassword123!"  "standard_user"
verify_account "user2"  "UserPassword123!"  "standard_user"

bad_headers=$(mktemp)
curl -s -D "$bad_headers" -o /dev/null -X POST "$BASE_URL/user/login" \
  --data-urlencode "username=admin" \
  --data-urlencode "password=WrongPassword999!"
if ! grep -qi "Location:.*/user/login?error" "$bad_headers"; then
  echo "[FAIL] Negative password rejection failed for spring-boot-forum" >&2
  rm -f "$bad_headers"
  exit 1
fi
rm -f "$bad_headers"
echo "[OK] Negative test passed (WrongPassword999! rejected)."
echo "=== ALL 4 ACCOUNTS VERIFIED SUCCESSFULLY ==="
