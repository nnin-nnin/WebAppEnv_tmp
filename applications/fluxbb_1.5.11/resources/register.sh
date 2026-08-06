#!/bin/bash
set -Eeuo pipefail
if [ "$#" -ne 3 ]; then echo "Usage: $0 USERNAME PASSWORD EMAIL" >&2; exit 2; fi
base_url="${FLUXBB_URL:-http://127.0.0.1:18311}"
username="$1"; password="$2"; email="$3"
cookiejar=$(mktemp); page=$(mktemp); response=$(mktemp)
trap 'rm -f "$cookiejar" "$page" "$response"' EXIT
curl --silent --show-error --fail --max-time 15 -c "$cookiejar" -b "$cookiejar" "$base_url/register.php" >"$page"
curl --silent --show-error --fail --max-time 15 -c "$cookiejar" -b "$cookiejar" -L \
    --data-urlencode form_sent=1 --data-urlencode req_user="$username" \
    --data-urlencode req_password1="$password" --data-urlencode req_password2="$password" \
    --data-urlencode req_email1="$email" --data-urlencode timezone=0 \
    --data-urlencode dst=0 --data-urlencode email_setting=1 \
    "$base_url/register.php?action=register" >"$response"
if grep -Eqi 'errors need to be corrected|The following errors' "$response"; then
    echo 'FluxBB rejected the registration form' >&2
    exit 1
fi
grep -Eqi 'Registration complete|registered|Welcome' "$response" || { echo 'FluxBB registration was not confirmed' >&2; exit 1; }
echo "FluxBB user registration succeeded for $username"
