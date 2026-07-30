#!/usr/bin/env bash
set -euo pipefail

base_url="${WORDPRESS_BASE_URL:-http://localhost:18084}"
username="${WORDPRESS_USERNAME:-admin}"
password="${WORDPRESS_PASSWORD:-benchmark-only}"
cookie_jar="$(mktemp)"

cleanup() {
  rm -f "$cookie_jar"
}
trap cleanup EXIT

curl --fail --silent --show-error --location \
  --cookie "$cookie_jar" \
  --cookie-jar "$cookie_jar" \
  --data-urlencode "log=$username" \
  --data-urlencode "pwd=$password" \
  --data-urlencode 'rememberme=forever' \
  --data-urlencode 'wp-submit=Log In' \
  --data-urlencode 'redirect_to=/wp-admin/' \
  "$base_url/wp-login.php" >/dev/null

dashboard="$(curl --fail --silent --show-error --location --cookie "$cookie_jar" "$base_url/wp-admin/")"
if ! grep -q 'Dashboard' <<<"$dashboard"; then
  echo "WordPress login failed for $username" >&2
  exit 1
fi

echo "WordPress login succeeded for $username"
