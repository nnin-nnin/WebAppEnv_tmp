#!/usr/bin/env bash
set -euo pipefail

base_url="${ATROPIM_URL:-http://localhost:18083}"

root_status="$(curl -sS --max-time "${HEALTHCHECK_TIMEOUT:-15}" -o /dev/null -w '%{http_code} %{redirect_url}' "$base_url/")"
if [[ "$root_status" != "200 " && "$root_status" != "302 " ]]; then
  echo "AtroPIM root is not ready: $root_status" >&2
  exit 1
fi

"$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/../resources" && pwd)/login.sh"
echo "AtroPIM healthcheck passed: $base_url"
