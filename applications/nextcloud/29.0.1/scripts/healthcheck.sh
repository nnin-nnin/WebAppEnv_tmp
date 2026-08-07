#!/usr/bin/env bash
set -Eeuo pipefail

BASE_URL=${NEXTCLOUD_URL:-http://127.0.0.1:18522}
health_file=/tmp/nextcloud-health.$$
trap 'rm -f "$health_file"' EXIT
status=$(curl --fail --silent --show-error --location --output "$health_file" --write-out '%{http_code}' "$BASE_URL/status.php")
if [[ "$status" != 200 ]] || ! grep -Eiq '"installed"[[:space:]]*:[[:space:]]*true' "$health_file"; then
    echo "Nextcloud health check failed at $BASE_URL (HTTP $status)" >&2
    exit 1
fi
echo "Nextcloud is healthy at $BASE_URL"

