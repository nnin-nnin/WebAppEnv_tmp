#!/usr/bin/env bash
set -e

APP_URL="${APP_URL:-http://127.0.0.1:28080}"
USERNAME="${USERNAME:-admin}"
PASSWORD="${PASSWORD:-admin_password}"
APP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
COMPOSE_FILE="$APP_DIR/docker/compose.yaml"
export COMPOSE_PROJECT_NAME=wordpress-7-0-3

# 1. Install WordPress through its bundled HTTP installer if needed.
COOKIE_FILE=$(mktemp)
INSTALL_PAGE=$(mktemp)
trap 'rm -f "$COOKIE_FILE" "$INSTALL_PAGE"' EXIT
if curl -sS -L -c "$COOKIE_FILE" -b "$COOKIE_FILE" "$APP_URL/wp-admin/install.php?step=1" > "$INSTALL_PAGE" \
  && grep -q "name=\"weblog_title\"" "$INSTALL_PAGE"; then
  echo "WordPress is not installed. Running the bundled web installer..."
  INSTALL_STATUS=$(curl -sS -L -o "$INSTALL_PAGE" -w "%{http_code}" \
    -c "$COOKIE_FILE" -b "$COOKIE_FILE" \
    -X POST "$APP_URL/wp-admin/install.php?step=2" \
    --data-urlencode "weblog_title=TestSite" \
    --data-urlencode "user_name=$USERNAME" \
    --data-urlencode "admin_password=$PASSWORD" \
    --data-urlencode "admin_password2=$PASSWORD" \
    --data-urlencode "admin_email=admin@example.com" \
    --data-urlencode "pw_weak=1" \
    --data-urlencode "blog_public=1" \
    --data-urlencode "Submit=Install WordPress")
  if [ "$INSTALL_STATUS" -lt 200 ] || [ "$INSTALL_STATUS" -ge 400 ] || grep -qiE "Installation Failed|already installed" "$INSTALL_PAGE"; then
    echo "WordPress installation failed (HTTP $INSTALL_STATUS)."
    exit 1
  fi
fi

# 2. Login through wp-login.php.
echo "Logging in as $USERNAME..."
curl -sS -c "$COOKIE_FILE" -b "$COOKIE_FILE" "$APP_URL/wp-login.php" > /dev/null

LOGIN_RES=$(curl -sS -i -L -c "$COOKIE_FILE" -b "$COOKIE_FILE" -X POST "$APP_URL/wp-login.php" \
  -d "log=$USERNAME" \
  -d "pwd=$PASSWORD" \
  -d "wp-submit=Log+In" \
  -d "redirect_to=$APP_URL/wp-admin/" \
  -d "testcookie=1")

if echo "$LOGIN_RES" | grep -q 'wordpress_logged_in_'; then
  echo "Login successful."
  exit 0
else
  echo "Login failed!"
  exit 1
fi
