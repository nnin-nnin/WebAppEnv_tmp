#!/usr/bin/env bash
set -euo pipefail

APP_URL="${APP_URL:-http://127.0.0.1:8085}"
ADMIN_USERNAME="${ADMIN_USERNAME:-admin}"
ADMIN_PASSWORD="${ADMIN_PASSWORD:-pass}"
NEW_USERNAME="${1:-testuser}"
NEW_PASSWORD="${2:-TestPassword3!}"
FIRST_NAME="${3:-Test}"
LAST_NAME="${4:-User}"
EMAIL="${5:-${NEW_USERNAME}@example.com}"

COOKIE_JAR="$(mktemp)"
FORM_PAGE="$(mktemp)"
FORM_RESPONSE="$(mktemp)"
trap 'rm -f "$COOKIE_JAR" "$FORM_PAGE" "$FORM_RESPONSE"' EXIT

echo "Authenticating as ${ADMIN_USERNAME}..."
LOGIN_STATUS=$(curl --max-time 300 -sS -o /dev/null -w "%{http_code}" \
  -c "$COOKIE_JAR" -b "$COOKIE_JAR" \
  -d "new_login_session_management=1" \
  -d "authUser=${ADMIN_USERNAME}" \
  -d "clearPass=${ADMIN_PASSWORD}" \
  -d "languageChoice=1" \
  "${APP_URL}/interface/main/main_screen.php?auth=login&site=default")
if [ "$LOGIN_STATUS" != "302" ]; then
  echo "Administrator login failed (HTTP ${LOGIN_STATUS})."
  exit 1
fi

curl --max-time 300 -fsS -c "$COOKIE_JAR" -b "$COOKIE_JAR" \
  "${APP_URL}/interface/usergroup/usergroup_admin_add.php" > "$FORM_PAGE"
CSRF_TOKEN=$(sed -n 's/.*name="csrf_token_form" value="\([^"]*\)".*/\1/p' "$FORM_PAGE" | head -n 1)
ACCESS_GROUP=$(sed -n '/<select name="access_group\[\]"/,/<\/select>/p' "$FORM_PAGE" \
  | sed -n "s/.*<option value=['\"]\([^'\"]*\)['\"].*/\1/p" \
  | grep -v '^Administrators$' | head -n 1)
if [ -z "$CSRF_TOKEN" ]; then
  echo "Could not obtain the OpenEMR form CSRF token."
  exit 1
fi
GROUP_NAME="Default"
ACCESS_GROUP="${ACCESS_GROUP:-Administrators}"

echo "Creating user ${NEW_USERNAME} through the OpenEMR Users form..."
CREATE_STATUS=$(curl --max-time 300 -sS -o "$FORM_RESPONSE" -w "%{http_code}" \
  -c "$COOKIE_JAR" -b "$COOKIE_JAR" \
  -X POST "${APP_URL}/interface/usergroup/usergroup_admin.php" \
  --data-urlencode "csrf_token_form=${CSRF_TOKEN}" \
  --data-urlencode "mode=new_user" \
  --data-urlencode "secure_pwd=1" \
  --data-urlencode "rumple=${NEW_USERNAME}" \
  --data-urlencode "stiltskin=${NEW_PASSWORD}" \
  --data-urlencode "adminPass=${ADMIN_PASSWORD}" \
  --data-urlencode "groupname=${GROUP_NAME}" \
  --data-urlencode "fname=${FIRST_NAME}" \
  --data-urlencode "lname=${LAST_NAME}" \
  --data-urlencode "email=${EMAIL}" \
  --data-urlencode "authorized=0" \
  --data-urlencode "facility_id=0" \
  --data-urlencode "billing_facility_id=0" \
  --data-urlencode "see_auth=1" \
  --data-urlencode "supervisor_id=0" \
  --data-urlencode "access_group[]=${ACCESS_GROUP}" \
  --data-urlencode "info=Created by delivery verification")
if [ "$CREATE_STATUS" != "200" ] && [ "$CREATE_STATUS" != "302" ]; then
  echo "OpenEMR user creation failed (HTTP ${CREATE_STATUS})."
  exit 1
fi

USERNAME="$NEW_USERNAME" PASSWORD="$NEW_PASSWORD" APP_URL="$APP_URL" \
  bash "$(dirname "$0")/login.sh"
echo "User ${NEW_USERNAME} created and login verified."
