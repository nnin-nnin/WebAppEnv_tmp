#!/usr/bin/env bash
set -Eeuo pipefail

url="${GITLAB_URL:-http://127.0.0.1:18528}"
code="$(curl -s -o /dev/null -w "%{http_code}" --max-time 10 "$url/users/sign_in" 2>/dev/null)" || code="000"
if [[ "$code" == "200" ]]; then
  echo "GitLab is healthy (HTTP 200)"
  exit 0
fi

echo "GitLab health check failed (HTTP $code)" >&2
exit 1
