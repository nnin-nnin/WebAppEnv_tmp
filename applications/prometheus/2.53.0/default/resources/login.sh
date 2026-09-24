#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18559}"
BASE_URL="http://localhost:${HOST_PORT}"

echo "Checking Prometheus at ${BASE_URL}..."

# Check /-/healthy endpoint
HEALTH_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/-/healthy")
if [ "$HEALTH_CODE" -ne 200 ]; then
    echo "FAILED: /-/healthy endpoint returned HTTP ${HEALTH_CODE}"
    exit 1
fi

# Check Web UI endpoint
UI_CODE=$(curl -s -o /dev/null -w "%{http_code}" -L "${BASE_URL}/query")
if [ "$UI_CODE" -ne 200 ]; then
    echo "FAILED: Web UI returned HTTP ${UI_CODE}"
    exit 1
fi

echo "SUCCESS: Prometheus service and Web UI verified successfully (HTTP ${HEALTH_CODE}, UI HTTP ${UI_CODE})"
exit 0
