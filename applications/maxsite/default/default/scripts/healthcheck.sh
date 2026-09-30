#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18841}"
URL="http://127.0.0.1:${HOST_PORT}"

echo "=== Health Checking MaxSite CMS at ${URL} ==="

cd "$APP_DIR"
docker compose -f docker/compose.yaml config --quiet

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" --max-time 10 "${URL}/" || true)

if [ "$HTTP_CODE" -eq 200 ] || [ "$HTTP_CODE" -eq 302 ]; then
    echo "SUCCESS: MaxSite CMS root URL returned HTTP ${HTTP_CODE}!"
else
    HTTP_CODE_ADMIN=$(curl -s -o /dev/null -w "%{http_code}" --max-time 10 "${URL}/admin" || true)
    if [ "$HTTP_CODE_ADMIN" -eq 200 ] || [ "$HTTP_CODE_ADMIN" -eq 302 ]; then
        echo "SUCCESS: Admin URL returned HTTP ${HTTP_CODE_ADMIN}!"
    else
        echo "ERROR: Service returned HTTP code ${HTTP_CODE} (admin: ${HTTP_CODE_ADMIN})"
        docker compose -f docker/compose.yaml ps
        docker compose -f docker/compose.yaml logs --tail=50
        exit 1
    fi
fi

if [ -x "${APP_DIR}/resources/login.sh" ]; then
    echo "=== Running Login Verification ==="
    APP_URL="${URL}" "${APP_DIR}/resources/login.sh"
fi

echo "=== MaxSite CMS Health Check PASSED ==="
