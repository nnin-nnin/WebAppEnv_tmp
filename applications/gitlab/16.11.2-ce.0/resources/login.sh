#!/usr/bin/env bash
set -Eeuo pipefail

url="${GITLAB_URL:-http://127.0.0.1:18528}"
username="${GITLAB_USERNAME:-admin}"
password="${GITLAB_PASSWORD:-${ADMIN_PASSWORD:-${PASSWORD:-WcGit!26-lP4yN8C}}}"

cookie_file="$(mktemp)"
body_file="$(mktemp)"
headers_file="$(mktemp)"
trap 'rm -f "$cookie_file" "$body_file" "$headers_file"' EXIT

code="000"
for attempt in $(seq 1 8); do
  rm -f "$cookie_file" "$body_file" "$headers_file"
  if ! curl -fsSL --max-time 20 -c "$cookie_file" -o "$body_file" "$url/users/sign_in"; then
    sleep 3
    continue
  fi

  csrf="$(sed -n 's/.*name="authenticity_token"[[:space:]]*value="\([^"]*\)".*/\1/p' "$body_file" | head -n 1)"
  if [[ -z "$csrf" ]]; then
    csrf="$(sed -n 's/.*value="\([^"]*\)"[[:space:]]*name="authenticity_token".*/\1/p' "$body_file" | head -n 1)"
  fi
  if [[ -z "$csrf" ]]; then
    csrf="$(sed -n 's/.*name="csrf-token"[[:space:]]*content="\([^"]*\)".*/\1/p' "$body_file" | head -n 1)"
  fi
  if [[ -z "$csrf" ]]; then
    csrf="$(sed -n 's/.*content="\([^"]*\)"[[:space:]]*name="csrf-token".*/\1/p' "$body_file" | head -n 1)"
  fi
  if [[ -z "$csrf" ]]; then
    sleep 3
    continue
  fi

  code="$(curl -sS --max-redirs 0 --max-time 20 -D "$headers_file" -o "$body_file" -w '%{http_code}' \
    -b "$cookie_file" -c "$cookie_file" \
    -H 'Accept: text/html' -X POST "$url/users/sign_in" \
    --data-urlencode "user[login]=$username" \
    --data-urlencode "user[password]=$password" \
    --data-urlencode "authenticity_token=$csrf")"

  if [[ "$code" == 302 ]] && grep -Eqi '^Location: .*/' "$headers_file"; then
    api_code="$(curl -sS --max-redirs 0 --max-time 20 -o "$body_file" -w '%{http_code}' \
      -b "$cookie_file" \
      -H 'Accept: application/json' "$url/api/v4/user")"

    if [[ "$api_code" == 200 ]] && grep -Eq '"username"[[:space:]]*:[[:space:]]*"'"$username"'"' "$body_file"; then
      echo "GitLab login succeeded for $username (authenticated API session verified)"
      exit 0
    fi
  fi

  sleep 3
done

echo "GitLab login failed (HTTP ${code:-000})" >&2
exit 1
