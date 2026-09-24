#!/usr/bin/env bash
set -e

APP_URL="${APP_URL:-http://localhost:18004}"
USERNAME="${ADMIN_USERNAME:-admin}"
PASSWORD="${ADMIN_PASSWORD:-benchmark-only}"

COOKIE_JAR=$(mktemp)

echo "Attempting login to Advocate Office Management System at ${APP_URL}..."

RESPONSE=$(curl -s -c "${COOKIE_JAR}" -b "${COOKIE_JAR}" \
  -X POST "${APP_URL}/control/login.php" \
  -d "username=${USERNAME}" \
  -d "password=${PASSWORD}" \
  -d "login=Login")

if echo "${RESPONSE}" | grep -qi "Login Successfully\|dashboard.php\|Success"; then
  echo "Login successfully verified!"
  rm -f "${COOKIE_JAR}"
  exit 0
else
  echo "Login failed!"
  echo "${RESPONSE}"
  rm -f "${COOKIE_JAR}"
  exit 1
fi
