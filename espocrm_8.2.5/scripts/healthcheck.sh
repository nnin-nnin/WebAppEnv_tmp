#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
project_dir="$(cd -- "$script_dir/.." && pwd)"

base_url="${ESPOCRM_URL:-http://localhost:18092}"
admin_user="${BENCHMARK_ADMIN_USERNAME:-admin}"
admin_password="${BENCHMARK_ADMIN_PASSWORD:-benchmark-only}"

root_status="$(curl -sS --max-time "${HEALTHCHECK_TIMEOUT:-15}" -o /dev/null -w '%{http_code} %{redirect_url}' "$base_url/")"
if [[ "$root_status" != "200 " ]]; then
  echo "EspoCRM root is not ready: $root_status" >&2
  exit 1
fi

api_response="$(curl -fsS --max-time "${HEALTHCHECK_TIMEOUT:-15}" \
  -u "${admin_user}:${admin_password}" \
  "$base_url/api/v1/App/user")"
if ! grep -Eq '"user"[[:space:]]*:' <<<"$api_response"; then
  echo "EspoCRM API did not return an authenticated user" >&2
  exit 1
fi

"$project_dir/resources/login.sh"
echo "EspoCRM healthcheck passed: $base_url"
