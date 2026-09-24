#!/usr/bin/env bash
set -euo pipefail

# Strip local proxies
export http_proxy=""
export https_proxy=""
export HTTP_PROXY=""
export HTTPS_PROXY=""
export all_proxy=""
export ALL_PROXY=""
export no_proxy="*"
export NO_PROXY="*"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${APP_DIR}/docker/compose.yaml"

echo "=== 1. Checking Compose Configuration ==="
docker compose -f "$COMPOSE_FILE" config --quiet

echo "=== 2. Checking Service Status ==="
WEB_STATUS=$(docker compose -f "$COMPOSE_FILE" ps web --format "{{.State}}" 2>/dev/null || echo "")

if [ "$WEB_STATUS" != "running" ]; then
    echo "ERROR: Web service is not running (Status: ${WEB_STATUS})"
    exit 1
fi

echo "=== 3. Checking Web Entrypoint ==="
HOST_PORT="${HOST_PORT:-18616}"
URL="http://${HOST:-localhost}:${HOST_PORT}"

HTTP_CODE=$(curl --noproxy "*" --max-time 5 -s -o /dev/null -w "%{http_code}" "${URL}/" || true)
if [ "$HTTP_CODE" -lt 200 ] || [ "$HTTP_CODE" -ge 400 ]; then
    echo "ERROR: Web entrypoint returned HTTP code ${HTTP_CODE} (Expected: 2xx/3xx)"
    exit 1
fi

echo "=== 4. Checking User Login / Endpoint ==="
if [ -x "${APP_DIR}/resources/login.sh" ]; then
    bash "${APP_DIR}/resources/login.sh"
fi

echo "=== Healthcheck PASSED ==="
exit 0
