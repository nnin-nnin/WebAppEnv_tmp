#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18582}"
ACTUATOR_URL="http://localhost:${HOST_PORT}/actuator/health"
CONSOLE_URL="http://localhost:${HOST_PORT}/console"

echo "Checking Halo health at ${ACTUATOR_URL}..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${ACTUATOR_URL}" || true)

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: Halo health endpoint returned HTTP $HTTP_CODE!"
    exit 0
fi

# Fallback: check console endpoint
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${CONSOLE_URL}" || true)
if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: Halo console returned HTTP $HTTP_CODE!"
    exit 0
else
    echo "FAILED: Halo service returned HTTP ${HTTP_CODE}"
    exit 1
fi
