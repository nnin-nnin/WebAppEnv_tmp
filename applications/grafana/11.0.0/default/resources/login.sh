#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18606}"
APP_URL="${APP_URL:-http://localhost:${HOST_PORT}}"
USERNAME="${1:-${GRAFANA_USER:-${ADMIN_USER:-admin}}}"
PASSWORD="${2:-${GRAFANA_PASSWORD:-${ADMIN_PASSWORD:-admin}}}"

echo "Logging in to Grafana as ${USERNAME} at ${APP_URL}..."

# Test POST /login endpoint
RESPONSE=$(curl -s -w "\n%{http_code}" -X POST "${APP_URL}/login" \
  -H "Content-Type: application/json" \
  -d "{\"user\":\"${USERNAME}\",\"password\":\"${PASSWORD}\"}")

HTTP_CODE=$(echo "$RESPONSE" | tail -n 1)
BODY=$(echo "$RESPONSE" | sed '$d')

if [ "$HTTP_CODE" -eq 200 ]; then
  echo "SUCCESS: Login successful via POST /login (HTTP ${HTTP_CODE})"
else
  echo "FAILED: Login failed via POST /login with HTTP ${HTTP_CODE}"
  echo "$BODY"
  exit 1
fi

# Verify authenticated user via API with Basic Auth
USER_CODE=$(curl -s -o /dev/null -w "%{http_code}" -u "${USERNAME}:${PASSWORD}" "${APP_URL}/api/user")
if [ "$USER_CODE" -eq 200 ]; then
  echo "SUCCESS: Authenticated API access verified via /api/user (HTTP ${USER_CODE})"
else
  echo "FAILED: /api/user verification returned HTTP ${USER_CODE}"
  exit 1
fi

exit 0
