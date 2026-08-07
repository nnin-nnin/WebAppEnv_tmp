#!/usr/bin/env bash
set -Eeuo pipefail

url="${GITLAB_URL:-http://127.0.0.1:18527}"
page="$(curl -fsSL --max-time 10 "$url/users/sign_in")"
printf '%s\n' "$page" | grep -Eiq 'GitLab|gitlab'
root_page="$(curl -fsSL --max-time 10 "$url/")"
printf '%s\n' "$root_page" | grep -Eiq 'GitLab|gitlab'
