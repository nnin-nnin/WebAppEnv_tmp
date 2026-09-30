#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18877}"
URL="http://127.0.0.1:${HOST_PORT}"

echo "=== Health Checking Yudao at ${URL} ==="

cd "$APP_DIR"
docker compose -f docker/compose.yaml config --quiet

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${URL}/healthz" || true)

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: Nginx health endpoint returned HTTP 200!"
else
    echo "ERROR: Health endpoint returned HTTP ${HTTP_CODE}"
    docker compose -f docker/compose.yaml ps
    docker compose -f docker/compose.yaml logs --tail=50
    exit 1
fi

HTML=$(curl -s "${URL}/")
if ! grep -q '<title>芋道管理系统</title>' <<<"$HTML" && ! grep -q '<div id="app"' <<<"$HTML"; then
    echo "ERROR: UI index did not return expected page content."
    exit 1
fi
echo "SUCCESS: UI index page loaded successfully!"

if [ -x "${APP_DIR}/resources/login.sh" ]; then
    echo "=== Running Login Verification ==="
    APP_URL="${URL}" "${APP_DIR}/resources/login.sh"
fi

echo "=== Yudao Health Check PASSED ==="
