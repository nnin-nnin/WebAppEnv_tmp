#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

echo "Starting Croogo 3.0.7 environment..."
cd "${APP_DIR}"

docker compose -f docker/compose.yaml config --quiet
docker compose -f docker/compose.yaml up -d

HOST_PORT="${HOST_PORT:-18624}"
BASE_URL="http://localhost:${HOST_PORT}"

echo "Waiting for Croogo web service to initialize..."
MAX_RETRIES=30
RETRY_COUNT=0
READY=0

while [ ${RETRY_COUNT} -lt ${MAX_RETRIES} ]; do
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/admin/users/users/login" || true)
    if [ "$HTTP_CODE" -eq 200 ]; then
        READY=1
        echo "Croogo web service is ready (HTTP 200)!"
        break
    fi
    RETRY_COUNT=$((RETRY_COUNT + 1))
    sleep 2
done

if [ ${READY} -ne 1 ]; then
    echo "WARNING: Croogo login endpoint did not return HTTP 200 within timeout."
fi

echo "Croogo startup complete."
