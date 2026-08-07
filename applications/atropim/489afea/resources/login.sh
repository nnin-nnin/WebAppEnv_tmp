#!/usr/bin/env bash
set -euo pipefail

base_url="${ATROPIM_URL:-http://localhost:18083}"
admin_user="${BENCHMARK_ADMIN_USER:-admin}"
admin_password="${BENCHMARK_ADMIN_PASSWORD:-benchmark-only}"

response="$(curl -fsS --max-time "${HEALTHCHECK_TIMEOUT:-15}" \
  -u "${admin_user}:${admin_password}" \
  "$base_url/api/v1/App/user")"

if ! grep -Eq '"user(Name)?"[[:space:]]*:' <<<"$response"; then
  printf 'AtroPIM login failed for user: %s\n' "$admin_user" >&2
  exit 1
fi

echo "AtroPIM login passed: $admin_user"
