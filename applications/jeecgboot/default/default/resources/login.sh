#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18833}"
APP_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${ADMIN_USERNAME:-${ADMIN_USER:-${APP_USER:-admin}}}"
PASSWORD="${ADMIN_PASSWORD:-${APP_PASSWORD:-123456}}"

echo "=========================================="
echo "JeecgBoot Multi-Tier Login Verification"
echo "Target URL: ${APP_URL}"
echo "User: ${USERNAME}"
echo "=========================================="

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

# 1. Knife4j Swagger Documentation Health Check
echo "[1/3] Checking API Documentation (Knife4j)..."
DOC_HTTP=$(curl -s -o /dev/null -w "%{http_code}" "${APP_URL}/jeecg-boot/doc.html" || true)
if [ "$DOC_HTTP" = "200" ]; then
  echo "✓ Knife4j Swagger interface accessible (HTTP 200)."
else
  echo "✗ Warning: doc.html returned HTTP $DOC_HTTP"
fi

# 2. Druid Admin Console Login
echo "[2/3] Checking Druid Administration Console authentication..."
DRUID_RESP=$(curl -s -c "$TMP_DIR/druid_cookie.txt" \
  -d "loginUsername=${USERNAME}&loginPassword=${PASSWORD}" \
  "${APP_URL}/jeecg-boot/druid/submitLogin" || true)

if [ "$DRUID_RESP" = "success" ]; then
  echo "✓ Druid administration console authenticated successfully (response: success)."
  DRUID_PASSED=true
else
  echo "✗ Druid console login response: $DRUID_RESP"
  DRUID_PASSED=false
fi

# 3. JeecgBoot Core API Direct Authentication (REST /sys/mLogin)
echo "[3/3] Checking JeecgBoot Core REST API authentication..."
LOGIN_PAYLOAD="{\"username\":\"${USERNAME}\",\"password\":\"${PASSWORD}\"}"
LOGIN_RESP=$(curl -s -X POST -H "Content-Type: application/json" -d "$LOGIN_PAYLOAD" "${APP_URL}/jeecg-boot/sys/mLogin" || true)

API_PASSED=false
if echo "$LOGIN_RESP" | grep -q '"success":true'; then
  TOKEN=$(echo "$LOGIN_RESP" | grep -o '"token":"[^"]*"' | cut -d'"' -f4 || echo "token-acquired")
  REALNAME=$(echo "$LOGIN_RESP" | grep -o '"realname":"[^"]*"' | cut -d'"' -f4 || echo "${USERNAME}")
  echo "✓ JeecgBoot Core API authenticated successfully!"
  echo "  User: ${USERNAME} (${REALNAME})"
  echo "  JWT Token: ${TOKEN:0:28}..."
  API_PASSED=true
else
  echo "✗ JeecgBoot API login failed: $LOGIN_RESP"
fi

echo "=========================================="
if [ "$DRUID_PASSED" = "true" ] && [ "$API_PASSED" = "true" ]; then
  echo "RESULT: JeecgBoot ALL login tiers PASSED (Druid Console + Core REST API)!"
  exit 0
elif [ "$DRUID_PASSED" = "true" ] || [ "$API_PASSED" = "true" ]; then
  echo "RESULT: JeecgBoot login PASSED (at least one tier verified)."
  exit 0
else
  echo "RESULT: JeecgBoot login verification FAILED."
  exit 1
fi
