#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18871}"
BASE_URL="http://127.0.0.1:${HOST_PORT}"

echo "[Trac] Running healthcheck against ${BASE_URL}..."

# 1. Root response check (HTTP 200)
ROOT_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)
if [ "$ROOT_CODE" -ne 200 ]; then
  echo "[Trac] FAILED: Root URL ${BASE_URL}/ returned HTTP ${ROOT_CODE} (expected 200)"
  exit 1
fi
echo "[Trac] Root endpoint verified (HTTP ${ROOT_CODE})."

# 2. Application signature check in body or headers
ROOT_BODY=$(curl -sL "${BASE_URL}/" || true)
if echo "$ROOT_BODY" | grep -qiE "(trac|Trac)"; then
  echo "[Trac] Application signature verified in HTML response."
else
  SERVER_HEADER=$(curl -sI "${BASE_URL}/" | grep -iE "(tracd|trac)" || true)
  if [ -z "$SERVER_HEADER" ]; then
    echo "[Trac] FAILED: Trac signature not found in headers or body"
    exit 1
  fi
fi

# 3. Invoke login test
if [ -x "$APP_DIR/resources/login.sh" ]; then
  echo "[Trac] Executing login verification..."
  "$APP_DIR/resources/login.sh"
fi

echo "[Trac] Healthcheck PASSED!"
exit 0
