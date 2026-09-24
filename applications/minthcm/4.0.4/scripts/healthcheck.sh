#!/usr/bin/env bash
set -Eeuo pipefail

base_url=${MINTHCM_URL:-http://127.0.0.1:18520}
base_url=${base_url%/}
html=$(mktemp)
trap 'rm -f "$html"' EXIT

http_code=$(curl --silent --show-error --location --max-time "${MINTHCM_HEALTHCHECK_TIMEOUT:-10}" \
    -o "$html" -w '%{http_code}' "${base_url}/")

if [ "$http_code" != "200" ]; then
    echo "Healthcheck failed: HTTP status ${http_code}" >&2
    exit 1
fi

grep -Eq '<div id="app"|/assets/[^" ]+\.js' "$html"
printf 'MintHCM HTTP health check passed: %s/\n' "$base_url"
