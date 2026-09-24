#!/usr/bin/env bash
set -e

# Strip local proxies
export http_proxy=""
export https_proxy=""
export HTTP_PROXY=""
export HTTPS_PROXY=""
export all_proxy=""
export ALL_PROXY=""
export no_proxy="*"
export NO_PROXY="*"

HOST_PORT="${HOST_PORT:-18616}"
BASE_URL="${BASE_URL:-http://localhost:${HOST_PORT}}"

echo "Checking Textpattern login / web endpoint at ${BASE_URL}..."

# Verify HTTP status 200 on /textpattern/index.php, /textpattern/, or /
HTTP_CODE=$(curl -s -L -o /dev/null -w "%{http_code}" "${BASE_URL}/textpattern/index.php" || true)
if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: Textpattern /textpattern/index.php endpoint reachable (HTTP $HTTP_CODE)"
    exit 0
fi

HTTP_CODE=$(curl -s -L -o /dev/null -w "%{http_code}" "${BASE_URL}/textpattern/" || true)
if [ "$HTTP_CODE" -eq 200 ]; then
    echo "SUCCESS: Textpattern /textpattern/ endpoint reachable (HTTP $HTTP_CODE)"
    exit 0
fi

ROOT_CODE=$(curl -s -L -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)
if [ "$ROOT_CODE" -eq 200 ]; then
    echo "SUCCESS: Textpattern root endpoint reachable (HTTP $ROOT_CODE)"
    exit 0
fi

echo "FAILED: Textpattern endpoint check failed (HTTP ${HTTP_CODE}, root: ${ROOT_CODE})"
exit 1
