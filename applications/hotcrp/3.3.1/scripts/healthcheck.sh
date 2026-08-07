#!/usr/bin/env bash
set -Eeuo pipefail

base_url="${HOTCRP_BASE_URL:-http://127.0.0.1:18403}"
body="$(mktemp)"
trap 'rm -f "$body"' EXIT
curl --fail --silent --show-error --max-time 15 "$base_url/" -o "$body"
grep -Eiq 'HotCRP|Sign in|Create account' "$body"
echo "HotCRP HTTP 健康检查通过：$base_url/"
