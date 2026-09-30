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

echo "Starting buggycart with Docker Compose..."
cd "$APP_DIR"

docker compose -f docker/compose.yaml up -d

echo "Containers started. Waiting for buggycart readiness..."
HOST_PORT="${HOST_PORT:-18849}"
URL="http://${HOST:-127.0.0.1}:${HOST_PORT}"

for i in $(seq 1 60); do
    HTTP_CODE=$(curl --noproxy "*" --max-time 3 -s -o /dev/null -w "%{http_code}" "$URL/" || true)
    if [ "$HTTP_CODE" -eq 200 ] || [ "$HTTP_CODE" -eq 302 ]; then
        echo "SUCCESS: buggycart is ready at $URL/ (HTTP $HTTP_CODE)!"
        exit 0
    fi
    sleep 1
done

echo "Containers running. Check $URL/"
