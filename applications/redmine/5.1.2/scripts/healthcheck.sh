#!/usr/bin/env bash
set -Eeuo pipefail

url="${REDMINE_URL:-http://127.0.0.1:18511/}"
body=$(mktemp)
trap 'rm -f "$body"' EXIT
status=$(curl -sS -L --max-time 15 -o "$body" -w '%{http_code}' "$url")
if [[ "$status" != 200 ]]; then
  echo "Redmine HTTP check failed: HTTP $status" >&2
  exit 1
fi
if ! grep -Eiq 'Redmine|Projects|My page' "$body"; then
  echo 'Redmine HTTP check failed: response is not the application page' >&2
  exit 1
fi
echo "Redmine is reachable at $url (HTTP 200)"
