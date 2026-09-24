#!/usr/bin/env bash
set -e

APP_URL="${APP_URL:-http://localhost:18004}"
NAME="${1:-New Client}"
GENDER="${2:-Male}"
DOB="${3:-1995-05-05}"
EMAIL="${4:-client@example.com}"
MOBILE="${5:-9876543210}"
ADDRESS="${6:-456 Test Street}"

COOKIE_JAR=$(mktemp)

# Authenticate as admin first
curl -s -c "${COOKIE_JAR}" -b "${COOKIE_JAR}" \
  -X POST "${APP_URL}/control/login.php" \
  -d "username=admin" \
  -d "password=benchmark-only" \
  -d "login=Login" > /dev/null

echo "Creating new client registration '${NAME}'..."

RESPONSE=$(curl -s -c "${COOKIE_JAR}" -b "${COOKIE_JAR}" \
  -X POST "${APP_URL}/control/add_client.php" \
  -d "name=${NAME}" \
  -d "gender=${GENDER}" \
  -d "dob=${DOB}" \
  -d "email=${EMAIL}" \
  -d "mobile=${MOBILE}" \
  -d "address=${ADDRESS}" \
  -d "submit=Submit")

if echo "${RESPONSE}" | grep -qiE "Fatal error|Could not Connect|Error:|mysqli_sql_exception"; then
  echo "Client creation failed: ${RESPONSE}" >&2
  rm -f "${COOKIE_JAR}"
  exit 1
fi

if echo "${RESPONSE}" | grep -qi "New record has been added successfully"; then
  echo "Client creation verified successfully."
  rm -f "${COOKIE_JAR}"
  exit 0
fi

echo "Client creation response did not contain a success marker." >&2
rm -f "${COOKIE_JAR}"
exit 1
