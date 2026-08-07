#!/bin/bash
set -Eeuo pipefail
base_url="${FLUXBB_URL:-http://127.0.0.1:18311}"
username="${FLUXBB_USERNAME:-admin}"
password="${FLUXBB_PASSWORD:-benchmark-only}"
cookiejar=$(mktemp); page=$(mktemp); response=$(mktemp)
trap 'rm -f "$cookiejar" "$page" "$response"' EXIT
curl --silent --show-error --fail --max-time 15 -c "$cookiejar" -b "$cookiejar" "$base_url/login.php" >"$page"
csrf=$(sed -n 's/.*name="csrf_token" value="\([^"]*\)".*/\1/p' "$page" | head -1)
[ -n "$csrf" ] || { echo 'Unable to find FluxBB CSRF token' >&2; exit 1; }
curl --silent --show-error --fail --max-time 15 -c "$cookiejar" -b "$cookiejar" -L \
    --data-urlencode form_sent=1 --data-urlencode redirect_url=index.php \
    --data-urlencode csrf_token="$csrf" --data-urlencode req_username="$username" \
    --data-urlencode req_password="$password" "$base_url/login.php?action=in" >"$response"
grep -Eqi 'Logout|Administration|FluxBB' "$response" || { echo 'FluxBB login was not confirmed' >&2; exit 1; }
echo "FluxBB login succeeded for $username at $base_url"
