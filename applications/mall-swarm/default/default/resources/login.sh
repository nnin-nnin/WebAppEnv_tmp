#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCEd[0]:-${0}}")" && pwd)"
APP_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
HOST_PORT="${HOST_PORT:-18840}"
APP_URL="${APP_URL:-http://127.0.0.1:${HOST_PORT}}"
USERNAME="${1:-${ADMIN_USERNAME:-admin}}"
PASSWORD="${2:-${ADMIN_PASSWORD:-macro123}}"

echo "=========================================="
echo "mall-swarm Multi-Tier Login Verification"
echo "Target URL: ${APP_URL}"
echo "User: ${USERNAME}"
echo "=========================================="

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

# 1. API Documentation & Actuator Health Check
echo "[1/3] Checking API Documentation and System Health..."
HEALTH_STATUS=$(curl -s "${APP_URL}/actuator/health" | grep -o '"status":"[^"]*"' | head -n 1 || true)
SWAGGER_HTTP=$(curl -s -L -o /dev/null -w "%{http_code}" "${APP_URL}/swagger-ui.html" || true)

if echo "$HEALTH_STATUS" | grep -q "UP" && [ "$SWAGGER_HTTP" = "200" ]; then
  echo "✓ Actuator health confirmed ($HEALTH_STATUS) & Swagger UI accessible (HTTP $SWAGGER_HTTP)."
else
  echo "✓ Swagger UI returned HTTP $SWAGGER_HTTP, Actuator: $HEALTH_STATUS"
fi

# 2. Core REST API Direct Authentication (/admin/login)
echo "[2/3] Checking mall-swarm Core REST API authentication..."
LOGIN_PAYLOAD="{\"username\":\"${USERNAME}\",\"password\":\"${PASSWORD}\"}"
LOGIN_RESP=$(curl -s -X POST -H "Content-Type: application/json" -d "$LOGIN_PAYLOAD" "${APP_URL}/admin/login" || true)

API_PASSED=false
TOKEN=""
TOKEN_HEAD=""
if echo "$LOGIN_RESP" | grep -q '"code":200'; then
  TOKEN=$(echo "$LOGIN_RESP" | grep -o '"token":"[^"]*"' | cut -d'"' -f4)
  TOKEN_HEAD=$(echo "$LOGIN_RESP" | grep -o '"tokenHead":"[^"]*"' | cut -d'"' -f4 || echo "Bearer ")
  echo "✓ mall-swarm Core API authenticated successfully!"
  echo "  User: ${USERNAME}"
  echo "  Token Head: ${TOKEN_HEAD}"
  echo "  Token: ${TOKEN:0:32}..."
else
  echo "✗ mall-swarm API login failed: $LOGIN_RESP"
fi

# 3. Authenticated Admin Session Validation (/admin/info)
echo "[3/3] Validating authenticated session against /admin/info..."
if [ -n "$TOKEN" ]; then
  INFO_RESP=$(curl -s -H "Authorization: ${TOKEN_HEAD}${TOKEN}" "${APP_URL}/admin/info" || true)
  if echo "$INFO_RESP" | grep -q '"code":200'; then
    ADMIN_NAME=$(echo "$INFO_RESP" | grep -o '"username":"[^"]*"' | cut -d'"' -f4 || echo "$USERNAME")
    ROLES=$(echo "$INFO_RESP" | grep -o '"roles":\[[^]]*\]' || echo "[]")
    echo "✓ Token validation passed against /admin/info!"
    echo "  Logged in as: ${ADMIN_NAME}"
    echo "  Assigned Roles: ${ROLES}"
    API_PASSED=true
  else
    echo "✗ Token validation against /admin/info failed: $INFO_RESP"
  fi
else
  echo "✗ Skipping session validation due to missing token."
fi

echo "=========================================="
if [ "$API_PASSED" = "true" ]; then
  echo "RESULT: mall-swarm login verification PASSED!"
  exit 0
else
  echo "RESULT: mall-swarm login verification FAILED."
  exit 1
fi
