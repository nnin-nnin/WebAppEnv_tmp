#!/usr/bin/env bash
set -e

APP_URL="${APP_URL:-http://localhost:18817}"
USERNAME="${ADMIN_USERNAME:-admin}"
PASSWORD="${ADMIN_PASSWORD:-AdminPassword123!}"

COOKIE_JAR=$(mktemp)

echo "Attempting login to Doctor Appointment System Admin at ${APP_URL}..."

# Submit login credentials to Backend/logincheck.php
RESPONSE=$(curl -s -L -c "${COOKIE_JAR}" -b "${COOKIE_JAR}" \
  -X POST "${APP_URL}/Backend/logincheck.php" \
  -d "uname=${USERNAME}" \
  -d "pass=${PASSWORD}" \
  -d "submit=Login")

# Verify access to Admin.php or success indicator
if echo "${RESPONSE}" | grep -qi "Admin|Home\|Hospital Management System\|Logout.php"; then
  echo "Login successfully verified!"
  rm -f "${COOKIE_JAR}"
  exit 0
else
  echo "Login failed!"
  echo "${RESPONSE}" | head -n 30
  rm -f "${COOKIE_JAR}"
  exit 1
fi
