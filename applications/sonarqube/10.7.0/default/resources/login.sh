#!/usr/bin/env bash
set -eo pipefail

HOST_PORT="${HOST_PORT:-18607}"
BASE_URL="${APP_URL:-http://localhost:${HOST_PORT}}"
USERNAME="${SONARQUBE_USER:-${ADMIN_USER:-${ADMIN_USERNAME:-${APP_USER:-admin}}}}"
PASSWORD="${SONARQUBE_PASSWORD:-${ADMIN_PASSWORD:-${APP_PASSWORD:-admin}}}"

echo "[*] Authenticating with SonarQube at ${BASE_URL} as ${USERNAME}..."

# 1. Attempt POST to /api/authentication/login
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -X POST \
  -d "login=${USERNAME}&password=${PASSWORD}" \
  "${BASE_URL}/api/authentication/login" || true)

if [ "$HTTP_CODE" -eq 200 ]; then
  echo "[+] Authentication successful via /api/authentication/login (HTTP 200)"
  exit 0
fi

# 2. Fallback attempt via HTTP Basic Auth /api/authentication/validate
VALID_RES=$(curl -s -u "${USERNAME}:${PASSWORD}" "${BASE_URL}/api/authentication/validate" || true)
if echo "$VALID_RES" | grep -q '"valid":true'; then
  echo "[+] Authentication successful via /api/authentication/validate"
  exit 0
fi

echo "[-] Authentication failed. Login returned HTTP ${HTTP_CODE}, validate returned: ${VALID_RES}"
exit 1
