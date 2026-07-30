#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
base_url="${MALL_URL:-http://localhost:18085}"
timeout="${MALL_TIMEOUT:-20}"

root_body_file="$(mktemp)"
trap 'rm -f "$root_body_file"' EXIT
root_status="$(curl -sS --max-time "$timeout" -o "$root_body_file" -w '%{http_code}' "$base_url/")"
root_body="$(cat "$root_body_file")"
if [[ "$root_status" != 200 ]]; then
  echo "mall homepage is not ready: HTTP $root_status" >&2
  exit 1
fi
if ! grep -q 'mall-admin-web' <<<"$root_body"; then
  echo "mall frontend is not present at the application root" >&2
  exit 1
fi

actuator_status="$(curl -sS --max-time "$timeout" -o /dev/null -w '%{http_code}' "$base_url/actuator/health")"
if [[ "$actuator_status" != 200 ]]; then
  echo "mall actuator health is not ready: HTTP $actuator_status" >&2
  exit 1
fi

MALL_URL="$base_url" "$script_dir/../resources/login.sh"
echo "mall healthcheck passed: $base_url"
