#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18658}"
URL="http://127.0.0.1:${HOST_PORT}/api/v1/health"

echo "Checking NocoDB health at ${URL}..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${URL}" || true)

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: NocoDB is healthy (HTTP ${HTTP_CODE})!"
    exit 0
else
    # Fallback to root path check
    FALLBACK_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:${HOST_PORT}/" || true)
    if [ "$FALLBACK_CODE" -eq 200 ]; then
        echo "SUCCESS: NocoDB web interface is accessible (HTTP ${FALLBACK_CODE})!"
        exit 0
    else
        echo "FAILED: NocoDB healthcheck returned HTTP ${HTTP_CODE} (fallback HTTP ${FALLBACK_CODE})"
        exit 1
    fi
fi
