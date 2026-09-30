#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18660}"
URL="${BASE_URL:-http://127.0.0.1:${HOST_PORT}}"

echo "Checking Trilium service health at $URL..."

# Step 1: Check internal health-check API endpoint
HEALTH_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$URL/api/health-check" || true)
if [ "$HEALTH_CODE" -eq 200 ]; then
    echo "SUCCESS: Trilium /api/health-check returned HTTP 200"
else
    echo "FAILED: Trilium /api/health-check returned HTTP $HEALTH_CODE"
    exit 1
fi

# Step 2: Check web root endpoint returns 200 (following redirects)
HTTP_CODE=$(curl -s -L -o /dev/null -w "%{http_code}" "$URL/" || true)
if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: Trilium web endpoint returned HTTP 200"
else
    echo "FAILED: Trilium web endpoint returned HTTP $HTTP_CODE"
    exit 1
fi

# Step 3: Check web interface content
PAGE_CONTENT=$(curl -sL "$URL/" || true)
if echo "$PAGE_CONTENT" | grep -qiE "(Trilium)"; then
    echo "SUCCESS: Trilium web interface verified"
else
    echo "FAILED: Page content does not match Trilium"
    exit 1
fi

# Step 4: Run login verification
if [ -x "$APP_DIR/resources/login.sh" ]; then
    "$APP_DIR/resources/login.sh"
fi

echo "Health check PASSED!"
exit 0
