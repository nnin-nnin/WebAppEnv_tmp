#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18823}"
URL="http://127.0.0.1:${HOST_PORT}"

echo "Checking Eve service health at ${URL}..."

# Check root endpoint
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${URL}/")
if [ "$HTTP_CODE" = "200" ] || [ "$HTTP_CODE" = "302" ]; then
    echo "SUCCESS: Eve root endpoint returned HTTP $HTTP_CODE"
else
    echo "FAILED: Eve root endpoint returned HTTP $HTTP_CODE"
    exit 1
fi

# Check health endpoint
HEALTH_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${URL}/health")
if [ "$HEALTH_CODE" = "200" ]; then
    echo "SUCCESS: Eve health endpoint returned HTTP $HEALTH_CODE"
else
    echo "FAILED: Eve health endpoint returned HTTP $HEALTH_CODE"
    exit 1
fi

# Run login check if available
if [ -x "$APP_DIR/resources/login.sh" ]; then
    "$APP_DIR/resources/login.sh"
fi

echo "Eve health check PASSED!"
