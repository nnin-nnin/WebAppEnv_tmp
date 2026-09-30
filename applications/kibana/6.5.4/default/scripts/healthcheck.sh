#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18649}"
URL="http://127.0.0.1:${HOST_PORT}"

echo "=== Health Checking Kibana at ${URL} ==="

cd "$APP_DIR"
docker compose -f docker/compose.yaml config --quiet

HTTP_CODE=$(curl --noproxy "*" -s -o /dev/null -w "%{http_code}" "${URL}/api/status" || true)

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: Kibana status API returned HTTP ${HTTP_CODE}!"
    exit 0
fi

HTTP_CODE_APP=$(curl --noproxy "*" -s -o /dev/null -w "%{http_code}" "${URL}/app/kibana" || true)
if [ "$HTTP_CODE_APP" -eq 200 ]; then
    echo "SUCCESS: Kibana web app returned HTTP ${HTTP_CODE_APP}!"
    exit 0
fi

echo "ERROR: Kibana service not ready (status code: ${HTTP_CODE}, app code: ${HTTP_CODE_APP})"
docker compose -f docker/compose.yaml ps
exit 1
