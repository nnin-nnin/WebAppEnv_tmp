#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18850}"
URL="http://127.0.0.1:${HOST_PORT}"

echo "=== Health Checking Osclass at ${URL} ==="

cd "$APP_DIR"
docker compose -f docker/compose.yaml config --quiet

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${URL}/" || true)

if [ "$HTTP_CODE" -eq 200 ] || [ "$HTTP_CODE" -eq 302 ]; then
    echo "SUCCESS: Osclass root page returned HTTP ${HTTP_CODE}!"
else
    echo "ERROR: Osclass root page returned HTTP code ${HTTP_CODE}"
    docker compose -f docker/compose.yaml ps
    docker compose -f docker/compose.yaml logs --tail=50
    exit 1
fi

ADMIN_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${URL}/oc-admin/index.php" || true)
if [ "$ADMIN_CODE" -eq 200 ] || [ "$ADMIN_CODE" -eq 302 ]; then
    echo "SUCCESS: Admin login page returned HTTP ${ADMIN_CODE}!"
else
    echo "ERROR: Admin login page returned HTTP code ${ADMIN_CODE}"
    docker compose -f docker/compose.yaml ps
    docker compose -f docker/compose.yaml logs --tail=50
    exit 1
fi

if [ -x "${APP_DIR}/resources/login.sh" ]; then
    echo "=== Running Login Verification ==="
    APP_URL="${URL}" "${APP_DIR}/resources/login.sh"
fi

echo "=== Osclass Health Check PASSED ==="
