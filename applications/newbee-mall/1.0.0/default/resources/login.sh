#!/usr/bin/env bash
set -euo pipefail

HOST_PORT="${HOST_PORT:-18086}"
APP_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"

echo "=================================================="
echo "Checking NewBee Mall 2x2 Matrix at ${APP_URL}..."
echo "=================================================="

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

verify_admin() {
  local USERNAME="$1"
  local PASSWORD="$2"
  local ROLE="$3"
  local COOKIE_JAR="$TMP_DIR/admin_${USERNAME}.cookies"
  local HEADERS="$TMP_DIR/admin_${USERNAME}.headers"

  curl -s -D "$HEADERS" -c "$COOKIE_JAR" "${APP_URL}/common/kaptcha" -o /dev/null
  local CODE
  CODE=$(awk 'tolower($1) == "x-captcha-code:" {print $2}' "$HEADERS" | tr -d '\r\n')
  if [[ -z "$CODE" ]]; then
    echo "[FAIL] Could not obtain X-Captcha-Code from /common/kaptcha for ${USERNAME}"
    exit 1
  fi

  local LOGIN_HEADERS="$TMP_DIR/admin_login_${USERNAME}.headers"
  curl -s -D "$LOGIN_HEADERS" -b "$COOKIE_JAR" -c "$COOKIE_JAR" \
    -X POST "${APP_URL}/admin/login" \
    --data-urlencode "userName=${USERNAME}" \
    --data-urlencode "password=${PASSWORD}" \
    --data-urlencode "verifyCode=${CODE}" -o /dev/null

  if ! grep -qi "Location:.*/admin/index" "$LOGIN_HEADERS"; then
    echo "[FAIL] Admin login did not redirect to /admin/index for ${USERNAME}"
    cat "$LOGIN_HEADERS"
    exit 1
  fi

  local PROFILE_PAGE
  PROFILE_PAGE=$(curl -s -b "$COOKIE_JAR" "${APP_URL}/admin/profile")
  if ! echo "$PROFILE_PAGE" | grep -q "${USERNAME}"; then
    echo "[FAIL] Admin /admin/profile verification failed for ${USERNAME}"
    exit 1
  fi
  echo "[OK] Verified administrator account: ${USERNAME} (${ROLE})"
}

verify_user() {
  local USERNAME="$1"
  local PASSWORD="$2"
  local ROLE="$3"
  local COOKIE_JAR="$TMP_DIR/user_${USERNAME}.cookies"
  local HEADERS="$TMP_DIR/user_${USERNAME}.headers"

  curl -s -D "$HEADERS" -c "$COOKIE_JAR" "${APP_URL}/common/mall/kaptcha" -o /dev/null
  local CODE
  CODE=$(awk 'tolower($1) == "x-captcha-code:" {print $2}' "$HEADERS" | tr -d '\r\n')
  if [[ -z "$CODE" ]]; then
    echo "[FAIL] Could not obtain X-Captcha-Code from /common/mall/kaptcha for ${USERNAME}"
    exit 1
  fi

  local RESP
  RESP=$(curl -s -b "$COOKIE_JAR" -c "$COOKIE_JAR" \
    -X POST "${APP_URL}/login" \
    --data-urlencode "loginName=${USERNAME}" \
    --data-urlencode "password=${PASSWORD}" \
    --data-urlencode "verifyCode=${CODE}")

  if ! echo "$RESP" | grep -q '"resultCode":200'; then
    echo "[FAIL] Standard user login failed for ${USERNAME}: ${RESP}"
    exit 1
  fi

  local PERSONAL_PAGE
  PERSONAL_PAGE=$(curl -s -b "$COOKIE_JAR" "${APP_URL}/personal")
  if ! echo "$PERSONAL_PAGE" | grep -q "${USERNAME}"; then
    echo "[FAIL] Standard user /personal session verification failed for ${USERNAME}"
    exit 1
  fi
  echo "[OK] Verified standard_user account: ${USERNAME} (${ROLE})"
}

verify_admin "admin"  "AdminPassword123!" "Administrator (Primary)"
verify_admin "admin2" "AdminPassword123!" "Administrator (Secondary)"
verify_user  "user1"  "UserPassword123!"  "Standard User A"
verify_user  "user2"  "UserPassword123!"  "Standard User B"

echo "[*] Verifying negative password rejection..."
BAD_COOKIE="$TMP_DIR/bad.cookies"
BAD_HEADERS="$TMP_DIR/bad.headers"
curl -s -D "$BAD_HEADERS" -c "$BAD_COOKIE" "${APP_URL}/common/mall/kaptcha" -o /dev/null
BAD_CODE=$(awk 'tolower($1) == "x-captcha-code:" {print $2}' "$BAD_HEADERS" | tr -d '\r\n')
BAD_RESP=$(curl -s -b "$BAD_COOKIE" -c "$BAD_COOKIE" \
  -X POST "${APP_URL}/login" \
  --data-urlencode "loginName=user1" \
  --data-urlencode "password=WrongPassword999!" \
  --data-urlencode "verifyCode=${BAD_CODE}")
if echo "$BAD_RESP" | grep -q '"resultCode":200'; then
  echo "[FAIL] Negative password rejection failed: ${BAD_RESP}"
  exit 1
fi
echo "[OK] Negative test passed (wrong password rejected: ${BAD_RESP})"
echo "=================================================="
echo "ALL 4 NEWBEE-MALL ACCOUNTS VERIFIED SUCCESSFULLY!"
echo "=================================================="
