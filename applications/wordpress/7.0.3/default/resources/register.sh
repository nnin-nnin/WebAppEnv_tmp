#!/usr/bin/env bash
set -euo pipefail

APP_URL="${APP_URL:-http://127.0.0.1:28080}"
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ADMIN_USERNAME="${ADMIN_USERNAME:-admin}"
ADMIN_PASSWORD="${ADMIN_PASSWORD:-admin_password}"
NEW_USER="${1:-${NEW_USER:-testuser}}"
NEW_PASSWORD="${2:-${NEW_PASSWORD:-testpassword}}"
NEW_EMAIL="${3:-${NEW_USER}@example.com}"

COOKIE_FILE=$(mktemp)
FORM_PAGE=$(mktemp)
RESPONSE_FILE=$(mktemp)
trap 'rm -f "$COOKIE_FILE" "$FORM_PAGE" "$RESPONSE_FILE"' EXIT

echo "Logging in as ${ADMIN_USERNAME}..."
curl -fsS -c "$COOKIE_FILE" -b "$COOKIE_FILE" "$APP_URL/wp-login.php" > /dev/null
LOGIN_STATUS=$(curl -sS -L -o /dev/null -w "%{http_code}" \
  -c "$COOKIE_FILE" -b "$COOKIE_FILE" -X POST "$APP_URL/wp-login.php" \
  --data-urlencode "log=$ADMIN_USERNAME" \
  --data-urlencode "pwd=$ADMIN_PASSWORD" \
  --data-urlencode "wp-submit=Log In" \
  --data-urlencode "redirect_to=$APP_URL/wp-admin/" \
  --data-urlencode "testcookie=1")
if [ "$LOGIN_STATUS" -lt 200 ] || [ "$LOGIN_STATUS" -ge 400 ]; then
  echo "Administrator login failed (HTTP $LOGIN_STATUS)."
  exit 1
fi

curl -fsS -c "$COOKIE_FILE" -b "$COOKIE_FILE" "$APP_URL/wp-admin/user-new.php" > "$FORM_PAGE"
NONCE=$(sed -n 's/.*name="_wpnonce_create-user" value="\([^"]*\)".*/\1/p' "$FORM_PAGE" | head -n 1)
if [ -z "$NONCE" ]; then
  echo "Could not obtain the WordPress user form nonce."
  exit 1
fi

STATUS=$(curl -sS -L -o "$RESPONSE_FILE" -w "%{http_code}" \
  -c "$COOKIE_FILE" -b "$COOKIE_FILE" -X POST "$APP_URL/wp-admin/user-new.php" \
  --data-urlencode "action=createuser" \
  --data-urlencode "user_login=$NEW_USER" \
  --data-urlencode "email=$NEW_EMAIL" \
  --data-urlencode "pass1=$NEW_PASSWORD" \
  --data-urlencode "pass2=$NEW_PASSWORD" \
  --data-urlencode "role=subscriber" \
  --data-urlencode "_wpnonce_create-user=$NONCE" \
  --data-urlencode "_wp_http_referer=/wp-admin/user-new.php" \
  --data-urlencode "createuser=Add New User")
if [ "$STATUS" -lt 200 ] || [ "$STATUS" -ge 400 ] || grep -qiE "already exists|Sorry, that username|Sorry, that email" "$RESPONSE_FILE"; then
  echo "WordPress user creation failed (HTTP $STATUS)."
  exit 1
fi
echo "User ${NEW_USER} created through the WordPress admin form."
env USERNAME="$NEW_USER" PASSWORD="$NEW_PASSWORD" bash "$DIR/login.sh"
