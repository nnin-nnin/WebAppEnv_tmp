#!/usr/bin/env bash
set -Eeuo pipefail

base_url=${MINTHCM_URL:-http://127.0.0.1:18520}
base_url=${base_url%/}
html=$(mktemp)
trap 'rm -f "$html"' EXIT
curl --fail --silent --show-error --location --max-time "${MINTHCM_HEALTHCHECK_TIMEOUT:-10}" "${base_url}/" -o "$html"
grep -Eq '<div id="app"|/assets/[^" ]+\.js' "$html"
printf 'MintHCM HTTP health check passed: %s/\n' "$base_url"
