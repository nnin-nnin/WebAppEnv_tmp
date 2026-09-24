#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

HOST_PORT="${HOST_PORT:-18596}"
URL="http://127.0.0.1:${HOST_PORT}"

echo "=== Health Checking Review Board at ${URL} ==="

cd "${APP_DIR}"
docker compose -f docker/compose.yaml config --quiet

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -L "${URL}/account/login/" || true)

if [ "${HTTP_CODE}" -eq 200 ]; then
    echo "SUCCESS: Review Board login endpoint returned HTTP ${HTTP_CODE}!"
else
    echo "ERROR: Service returned HTTP code ${HTTP_CODE}"
    docker compose -f docker/compose.yaml ps
    docker compose -f docker/compose.yaml logs --tail=50
    exit 1
fi

echo "=== Review Board Health Check PASSED ==="
