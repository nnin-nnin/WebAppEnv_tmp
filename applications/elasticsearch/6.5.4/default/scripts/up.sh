#!/usr/bin/env bash
set -eo pipefail

# Strip local proxies to ensure direct localhost connections
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

echo "Starting Elasticsearch 6.8.6 with Docker Compose..."
cd "$APP_DIR"

docker compose -f docker/compose.yaml up -d

echo "Elasticsearch containers started. Waiting for service readiness..."
HOST_PORT="${HOST_PORT:-18748}"
URL="http://${HOST:-localhost}:${HOST_PORT}"

for i in $(seq 1 45); do
    if curl --noproxy "*" --max-time 3 -s -o /dev/null -w "%{http_code}" "$URL/" | grep -qE "^[23]"; then
        echo "SUCCESS: Elasticsearch is ready at $URL/!"
        exit 0
    fi
    sleep 1
done

echo "Containers running. Check $URL/"
