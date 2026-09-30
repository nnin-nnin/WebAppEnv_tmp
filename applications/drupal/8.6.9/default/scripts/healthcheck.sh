#!/usr/bin/env bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
docker compose -f "${DIR}/docker/compose.yaml" ps | grep -q "Up" || {
    echo "Healthcheck failed: container is not running"
    exit 1
}

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:18771/" || true)
if [ "${HTTP_CODE}" -eq 200 ]; then
    echo "Healthcheck passed: HTTP 200 received"
    exit 0
else
    echo "Healthcheck failed: HTTP ${HTTP_CODE}"
    exit 1
fi
