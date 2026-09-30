#!/usr/bin/env bash
set -eo pipefail

export http_proxy=""
export https_proxy=""
export HTTP_PROXY=""
export HTTPS_PROXY=""
export all_proxy=""
export ALL_PROXY=""
export no_proxy="*"
export NO_PROXY="*"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "Starting Apache Kylin with Docker Compose..."
cd "$APP_DIR"

docker compose -f docker/compose.yaml up -d

echo "Containers started. Waiting for Apache Kylin readiness..."
HOST_PORT="${HOST_PORT:-18802}"
URL="http://${HOST:-127.0.0.1}:${HOST_PORT}"

for i in $(seq 1 150); do
    HTTP_CODE=$(curl --noproxy "*" --max-time 3 -s -o /dev/null -w "%{http_code}" "$URL/kylin/" || true)
    if [ "$HTTP_CODE" -eq 200 ] || [ "$HTTP_CODE" -eq 302 ]; then
        echo "SUCCESS: Apache Kylin is ready at $URL/kylin/ (HTTP $HTTP_CODE)!"
        exit 0
    fi
    sleep 2
done

echo "ERROR: Timed out waiting for Apache Kylin at $URL/kylin/." >&2
exit 1
