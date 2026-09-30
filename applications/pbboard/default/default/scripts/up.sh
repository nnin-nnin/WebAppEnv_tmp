#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "Starting pbboard (default) with Docker Compose..."
cd "$APP_DIR"

docker compose -f docker/compose.yaml up -d

HOST_PORT="${HOST_PORT:-18852}"
URL="http://127.0.0.1:${HOST_PORT}"

echo "Waiting for pbboard service to be ready at ${URL}..."
MAX_ATTEMPTS=60
ATTEMPT=0

while [ "$ATTEMPT" -lt "$MAX_ATTEMPTS" ]; do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$URL/" || true)
    if [ "$HTTP_CODE" = "200" ] || [ "$HTTP_CODE" = "301" ] || [ "$HTTP_CODE" = "302" ]; then
        echo "SUCCESS: pbboard is ready at ${URL} (HTTP $HTTP_CODE)!"
        exit 0
    fi
    ATTEMPT=$((ATTEMPT + 1))
    sleep 2
done

echo "ERROR: pbboard failed to become ready within $((MAX_ATTEMPTS * 2)) seconds." >&2
exit 1
