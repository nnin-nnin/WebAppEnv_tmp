#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "Starting elk (default) with Docker Compose..."
cd "$APP_DIR"

docker compose -f docker/compose.yaml up -d

HOST_PORT="${HOST_PORT:-18821}"
URL="http://127.0.0.1:${HOST_PORT}"

echo "Waiting for Kibana web service to be ready at ${URL}..."
MAX_ATTEMPTS=60
ATTEMPT=0

while [ "$ATTEMPT" -lt "$MAX_ATTEMPTS" ]; do
    HTTP_CODE=$(curl --noproxy "*" -s -o /dev/null -w "%{http_code}" "$URL/api/status" || true)
    if [ "$HTTP_CODE" = "200" ] || [ "$HTTP_CODE" = "302" ]; then
        echo "SUCCESS: Kibana is ready at ${URL} (HTTP $HTTP_CODE)!"
        exit 0
    fi
    HTTP_CODE_APP=$(curl --noproxy "*" -s -o /dev/null -w "%{http_code}" "$URL/app/kibana" || true)
    if [ "$HTTP_CODE_APP" = "200" ] || [ "$HTTP_CODE_APP" = "302" ]; then
        echo "SUCCESS: Kibana web app is ready at ${URL} (HTTP $HTTP_CODE_APP)!"
        exit 0
    fi
    ATTEMPT=$((ATTEMPT + 1))
    sleep 2
done

echo "ERROR: Kibana failed to become ready within $((MAX_ATTEMPTS * 2)) seconds." >&2
docker compose -f docker/compose.yaml ps
exit 1
