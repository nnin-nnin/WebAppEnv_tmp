#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ENV_FILE="$ROOT_DIR/docker/.env"
requested_app_url="${APP_URL-}"
requested_host_port="${DRUPAL_HOST_PORT-}"
requested_username="${DRUPAL_USERNAME-}"
requested_password="${DRUPAL_PASSWORD-}"

set -a
. "$ENV_FILE"
set +a

if [[ -n "$requested_app_url" ]]; then APP_URL="$requested_app_url"; fi
if [[ -n "$requested_host_port" ]]; then DRUPAL_HOST_PORT="$requested_host_port"; fi
if [[ -n "$requested_username" ]]; then DRUPAL_USERNAME="$requested_username"; fi
if [[ -n "$requested_password" ]]; then DRUPAL_PASSWORD="$requested_password"; fi

APP_URL="${APP_URL:-http://127.0.0.1:${DRUPAL_HOST_PORT:-18090}}"
DRUPAL_USERNAME="${DRUPAL_USERNAME:-${DRUPAL_ADMIN_NAME:-admin}}"
DRUPAL_PASSWORD="${DRUPAL_PASSWORD:-${DRUPAL_ADMIN_PASSWORD:-Drupal8615Admin!}}"

work_dir="$(mktemp -d)"
trap 'rm -rf "$work_dir"' EXIT

login_page="$work_dir/login.html"
cookie_jar="$work_dir/cookies.txt"
response_page="$work_dir/response.html"

curl --fail --silent --show-error \
  --cookie-jar "$cookie_jar" \
  "$APP_URL/user/login" \
  --output "$login_page"

form_build_id="$(sed -n 's/.*name="form_build_id" value="\([^"]*\)".*/\1/p' "$login_page" | head -n 1)"
if [[ -z "$form_build_id" ]]; then
  echo "Unable to read Drupal login form_build_id from $APP_URL/user/login" >&2
  exit 1
fi

effective_url="$(curl --fail --silent --show-error --location \
  --cookie "$cookie_jar" \
  --cookie-jar "$cookie_jar" \
  --data-urlencode "name=$DRUPAL_USERNAME" \
  --data-urlencode "pass=$DRUPAL_PASSWORD" \
  --data-urlencode "form_build_id=$form_build_id" \
  --data-urlencode "form_id=user_login_form" \
  --data-urlencode "op=Log in" \
  "$APP_URL/user/login" \
  --output "$response_page" \
  --write-out '%{url_effective}')"

if ! grep -Eq '/user/logout' "$response_page"; then
  echo "Drupal login failed for user $DRUPAL_USERNAME" >&2
  exit 1
fi

echo "Drupal login succeeded for $DRUPAL_USERNAME ($effective_url)"
