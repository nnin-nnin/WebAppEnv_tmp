#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18601}"
URL="http://127.0.0.1:${HOST_PORT}"

echo "=== Health Checking TestLink at ${URL} ==="

cd "$APP_DIR"
docker compose -f docker/compose.yaml config --quiet

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${URL}/login.php" || true)

if [ "$HTTP_CODE" -eq 200 ] || [ "$HTTP_CODE" -eq 302 ]; then
    echo "SUCCESS: Login page returned HTTP ${HTTP_CODE}!"
else
    HTTP_CODE_ROOT=$(curl -s -o /dev/null -w "%{http_code}" "${URL}/" || true)
    if [ "$HTTP_CODE_ROOT" -eq 200 ] || [ "$HTTP_CODE_ROOT" -eq 302 ]; then
        echo "SUCCESS: Root URL returned HTTP ${HTTP_CODE_ROOT}!"
    else
        echo "ERROR: Service returned HTTP code ${HTTP_CODE} (root: ${HTTP_CODE_ROOT})"
        docker compose -f docker/compose.yaml ps
        docker compose -f docker/compose.yaml logs --tail=50
        exit 1
    fi
fi

if [ -x "${APP_DIR}/resources/login.sh" ]; then
    echo "=== Running Login Verification ==="
    APP_URL="${URL}" "${APP_DIR}/resources/login.sh"
fi

echo "=== TestLink Health Check PASSED ==="
