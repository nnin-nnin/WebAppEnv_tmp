#!/usr/bin/env bash
set -euo pipefail

base_url="${ESPOCRM_URL:-http://localhost:18092}"
admin_user="${BENCHMARK_ADMIN_USERNAME:-admin}"
admin_password="${BENCHMARK_ADMIN_PASSWORD:-benchmark-only}"

response="$(curl -fsS --max-time "${HEALTHCHECK_TIMEOUT:-15}" \
  -u "${admin_user}:${admin_password}" \
  "$base_url/api/v1/App/user")"

if ! grep -Eq '"user"[[:space:]]*:' <<<"$response"; then
  echo "EspoCRM login failed for user: $admin_user" >&2
  exit 1
fi

echo "EspoCRM login passed: $admin_user"
