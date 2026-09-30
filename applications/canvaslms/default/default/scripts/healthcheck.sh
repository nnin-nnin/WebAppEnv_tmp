#!/usr/bin/env bash
set -Eeuo pipefail

url="${CANVAS_URL:-http://127.0.0.1:18805/login/canvas}"
body=$(mktemp)
trap 'rm -f "$body"' EXIT

status=$(curl -sS -L --max-time 15 -o "$body" -w '%{http_code}' "$url")
if [[ "$status" != 200 && "$status" != 302 ]]; then
  echo "Canvas LMS HTTP check failed: HTTP $status" >&2
  exit 1
fi

if ! grep -Eiq 'Canvas|Log In|pseudonym_session' "$body"; then
  echo 'Canvas LMS HTTP check failed: response is not the login or application page' >&2
  exit 1
fi

echo "Canvas LMS is reachable at $url (HTTP $status)"
