#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18844}"
URL="http://127.0.0.1:${HOST_PORT}"

echo "=== Health Checking MODX at ${URL} ==="

cd "$APP_DIR"
docker compose -f docker/compose.yaml config --quiet

# 1. Check frontend root
HTTP_CODE_ROOT=$(curl -s -o /dev/null -w "%{http_code}" "${URL}/" || true)
if [ "$HTTP_CODE_ROOT" -eq 200 ] || [ "$HTTP_CODE_ROOT" -eq 302 ]; then
    echo "SUCCESS: Frontend root URL returned HTTP ${HTTP_CODE_ROOT}!"
else
    echo "ERROR: Frontend root returned unexpected HTTP code ${HTTP_CODE_ROOT}"
    docker compose -f docker/compose.yaml ps
    docker compose -f docker/compose.yaml logs --tail=50
    exit 1
fi

# 2. Check manager login page
HTTP_CODE_MGR=$(curl -s -o /dev/null -w "%{http_code}" "${URL}/manager/" || true)
if [ "$HTTP_CODE_MGR" -eq 200 ] || [ "$HTTP_CODE_MGR" -eq 302 ]; then
    echo "SUCCESS: Manager login page returned HTTP ${HTTP_CODE_MGR}!"
else
    echo "ERROR: Manager page returned unexpected HTTP code ${HTTP_CODE_MGR}"
    docker compose -f docker/compose.yaml ps
    docker compose -f docker/compose.yaml logs --tail=50
    exit 1
fi

# 3. Run login authentication verification
if [ -x "${APP_DIR}/resources/login.sh" ]; then
    echo "=== Running Manager Login Verification ==="
    APP_URL="${URL}" "${APP_DIR}/resources/login.sh"
fi

echo "=== MODX Health Check PASSED ==="
