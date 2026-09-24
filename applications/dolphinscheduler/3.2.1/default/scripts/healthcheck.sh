#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

HOST_PORT="${HOST_PORT:-18585}"
URL="http://localhost:${HOST_PORT}/dolphinscheduler/ui"

echo "Checking Apache DolphinScheduler health at ${URL}..."
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${URL}" || true)

if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: DolphinScheduler UI returned HTTP $HTTP_CODE!"
    exit 0
else
    echo "FAILED: DolphinScheduler UI returned HTTP ${HTTP_CODE}"
    exit 1
fi
