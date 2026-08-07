#!/usr/bin/env bash
set -Eeuo pipefail

if [[ $# -ne 2 ]]; then
  echo "Usage: GITLAB_ADMIN_TOKEN=... GITLAB_NEW_USER_PASSWORD=... $0 USERNAME EMAIL" >&2
  exit 2
fi
: "${GITLAB_ADMIN_TOKEN:?Set GITLAB_ADMIN_TOKEN from the controlled credential channel}"
: "${GITLAB_NEW_USER_PASSWORD:?Set GITLAB_NEW_USER_PASSWORD from the controlled credential channel}"
url="${GITLAB_URL:-http://127.0.0.1:18527}"
username="$1"
email="$2"

response="$(mktemp)"
trap 'rm -f "$response"' EXIT
code="$(curl -sS --max-time 20 -o "$response" -w '%{http_code}' \
  -X POST "$url/api/v4/users" \
  -H "PRIVATE-TOKEN: $GITLAB_ADMIN_TOKEN" \
  --data-urlencode "username=$username" \
  --data-urlencode "name=$username" \
  --data-urlencode "email=$email" \
  --data-urlencode "password=$GITLAB_NEW_USER_PASSWORD" \
  --data-urlencode 'skip_confirmation=true')"

if [[ "$code" == 2* ]] && grep -Eq '"username"[[:space:]]*:[[:space:]]*"'"$username"'"' "$response"; then
  echo "GitLab user creation succeeded for $username"
else
  echo "GitLab user creation failed (HTTP $code)" >&2
  exit 1
fi
