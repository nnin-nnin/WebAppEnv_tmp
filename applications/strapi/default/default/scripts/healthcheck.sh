#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18867}"
BASE_URL="http://127.0.0.1:${HOST_PORT}"

echo "[Strapi] Running healthcheck against ${BASE_URL}..."

# 1. Root redirect or response check (302 or 200)
ROOT_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/" || true)
if [ "$ROOT_CODE" -ne 200 ] && [ "$ROOT_CODE" -ne 302 ]; then
  echo "[Strapi] FAILED: Root URL ${BASE_URL}/ returned HTTP ${ROOT_CODE} (expected 200 or 302)"
  exit 1
fi
echo "[Strapi] Root endpoint verified (HTTP ${ROOT_CODE})."

# 2. Admin interface accessibility check
ADMIN_CODE=$(curl -s -o /dev/null -w "%{http_code}" "${BASE_URL}/admin" || true)
if [ "$ADMIN_CODE" -ne 200 ]; then
  echo "[Strapi] FAILED: Admin panel ${BASE_URL}/admin returned HTTP ${ADMIN_CODE} (expected 200)"
  exit 1
fi
echo "[Strapi] Admin endpoint verified (HTTP 200)."

# 3. Content signature check
ADMIN_BODY=$(curl -sL "${BASE_URL}/admin" || true)
if echo "$ADMIN_BODY" | grep -qiE "(strapi|Strapi)"; then
  echo "[Strapi] Application signature verified in HTML response."
else
  echo "[Strapi] WARNING: Strapi signature not explicitly matched in HTML, checking headers..."
  HEADER_STRAPI=$(curl -sI "${BASE_URL}/admin" | grep -i "Strapi" || true)
  if [ -z "$HEADER_STRAPI" ]; then
    echo "[Strapi] FAILED: Strapi signature not found in headers or body"
    exit 1
  fi
fi

# 4. Invoke login test
if [ -x "$APP_DIR/resources/login.sh" ]; then
  echo "[Strapi] Executing login verification..."
  "$APP_DIR/resources/login.sh"
fi

echo "[Strapi] Healthcheck PASSED!"
exit 0
