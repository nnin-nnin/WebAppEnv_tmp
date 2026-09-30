#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18864}"
BASE_URL="${SILVERPEAS_URL:-http://127.0.0.1:${HOST_PORT}}"

echo "Checking Silverpeas service readiness at ${BASE_URL}..."

STATUS=$(curl -s -o /dev/null -w "%{http_code}" --max-time 10 "${BASE_URL}/silverpeas/defaultLogin.jsp" || true)

if [ "$STATUS" -ne 200 ] && [ "$STATUS" -ne 302 ]; then
    echo "FAILED: Silverpeas returned HTTP ${STATUS} (expected 200 or 302)"
    exit 1
fi

echo "Silverpeas HTTP status check passed (HTTP ${STATUS})."

echo "Verifying admin login via login.sh..."
bash "$APP_DIR/resources/login.sh"

echo "=== ALL SILVERPEAS HEALTHCHECKS PASSED ==="
exit 0
