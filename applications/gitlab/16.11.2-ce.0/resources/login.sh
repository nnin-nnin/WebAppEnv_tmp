#!/usr/bin/env bash
set -Eeuo pipefail

url="${GITLAB_URL:-http://127.0.0.1:18527}"
username="${GITLAB_USERNAME:-admin}"
: "${GITLAB_PASSWORD:?Set GITLAB_PASSWORD from the controlled credential channel}"

cookie_file="$(mktemp)"
body_file="$(mktemp)"
headers_file="$(mktemp)"
trap 'rm -f "$cookie_file" "$body_file" "$headers_file"' EXIT

curl -fsSL --max-time 20 -c "$cookie_file" -o "$body_file" "$url/users/sign_in"
csrf="$(sed -n 's/.*name="authenticity_token" value="\([^"]*\)".*/\1/p' "$body_file" | head -n 1)"
[[ -n "$csrf" ]]

code="$(curl -sS --max-redirs 0 --max-time 20 -D "$headers_file" -o "$body_file" -w '%{http_code}' \
  -b "$cookie_file" -c "$cookie_file" \
  -H 'Accept: text/html' -X POST "$url/users/sign_in" \
  --data-urlencode "user[login]=$username" \
  --data-urlencode "user[password]=$GITLAB_PASSWORD" \
  --data-urlencode "authenticity_token=$csrf")"

if [[ "$code" == 302 ]] && grep -Eqi '^Location: .*/' "$headers_file"; then
  api_code="$(curl -sS --max-redirs 0 --max-time 20 -o "$body_file" -w '%{http_code}' \
    -b "$cookie_file" \
    -H 'Accept: application/json' "$url/api/v4/user")"

  if [[ "$api_code" == 200 ]] && grep -Eq '"username"[[:space:]]*:[[:space:]]*"'"$username"'"' "$body_file"; then
    echo "GitLab login succeeded for $username (authenticated API session verified)"
  else
    echo "GitLab login failed (authenticated API session rejected, HTTP $api_code)" >&2
    exit 1
  fi
else
  echo "GitLab login failed (HTTP $code)" >&2
  exit 1
fi
