#!/usr/bin/env bash
set -eo pipefail

HOST_PORT="${HOST_PORT:-18830}"
USERNAME="${ADMIN_USERNAME:-admin}"
PASSWORD="${ADMIN_PASSWORD:-AdminPassword123!}"
LOGIN_URL="http://127.0.0.1:${HOST_PORT}/includes/login-hm.inc.php"
ADMIN_HOME_URL="http://127.0.0.1:${HOST_PORT}/admin/admin_home.php"

echo "[*] Attempting admin login to Hostel Management System at http://127.0.0.1:${HOST_PORT}..."

COOKIE_FILE=$(mktemp)
trap 'rm -f "$COOKIE_FILE"' EXIT

LOGIN_RESP=$(curl --noproxy "*" -s -i -c "$COOKIE_FILE" -b "$COOKIE_FILE" \
  -d "username=${USERNAME}" \
  -d "pwd=${PASSWORD}" \
  -d "login-submit=" \
  "$LOGIN_URL" || true)

if ! echo "$LOGIN_RESP" | grep -q "Location: ../admin/admin_home.php"; then
    echo "[-] FAILED: Login response did not redirect to admin_home.php"
    echo "$LOGIN_RESP" | head -n 20
    exit 1
fi

HOME_RESP=$(curl --noproxy "*" -s -b "$COOKIE_FILE" "$ADMIN_HOME_URL" || true)

if echo "$HOME_RESP" | grep -q "admin_profile.php"; then
    echo "[+] SUCCESS: Admin login verified successfully for user '${USERNAME}'!"
    exit 0
else
    echo "[-] FAILED: Admin home page does not contain expected profile link after login"
    echo "$HOME_RESP" | head -n 30
    exit 1
fi
