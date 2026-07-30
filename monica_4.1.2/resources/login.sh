#!/usr/bin/env bash
set -euo pipefail

base_url="${APP_URL:-http://localhost:18086}"
username="${APP_USERNAME:-${MONICA_USERNAME:-admin@example.com}}"
password="${APP_PASSWORD:-${MONICA_PASSWORD:-benchmark-only}}"
timeout="${APP_TIMEOUT:-20}"

cookie_file="$(mktemp)"
login_page="$(mktemp)"
dashboard_page="$(mktemp)"
trap 'rm -f "$cookie_file" "$login_page" "$dashboard_page"' EXIT

curl -fsS --max-time "$timeout" -c "$cookie_file" -o "$login_page" "$base_url/login"
csrf_token="$(sed -n 's/.*name="_token"[^>]*value="\([^"]*\)".*/\1/p' "$login_page" | head -n 1)"
if [[ -z "$csrf_token" ]]; then
  echo "Monica login page did not contain a CSRF token" >&2
  exit 1
fi

status="$(curl -sS --max-time "$timeout" -L -c "$cookie_file" -b "$cookie_file" \
  -H 'Accept: text/html' \
  --data-urlencode "_token=$csrf_token" \
  --data-urlencode "email=$username" \
  --data-urlencode "password=$password" \
  --data-urlencode 'remember=on' \
  -o "$dashboard_page" -w '%{http_code}' "$base_url/login")"

if [[ "$status" != 200 ]] || ! grep -Eiq 'Dashboard|People|Contacts|Monica' "$dashboard_page"; then
  echo "Monica login failed for $username (HTTP $status)" >&2
  exit 1
fi

echo "Monica login succeeded for $username; dashboard page received"
