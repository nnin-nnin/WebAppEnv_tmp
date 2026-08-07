#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 4 ]; then
  echo "Usage: $0 USERNAME EMAIL FIRST_NAME LAST_NAME" >&2
  exit 2
fi

base_url="${MAUTIC_URL:-http://localhost:18518}"
admin_username="${MAUTIC_USERNAME:-admin}"
: "${MAUTIC_PASSWORD:?Set MAUTIC_PASSWORD through the controlled credential channel}"
: "${MAUTIC_REGISTER_PASSWORD:?Set MAUTIC_REGISTER_PASSWORD through the controlled credential channel}"
new_username="$1"
new_email="$2"
first_name="$3"
last_name="$4"

response_file="$(mktemp)"
roles_file="$(mktemp)"
trap 'rm -f "$response_file" "$roles_file"' EXIT

roles_status="$(curl -sS -o "$roles_file" -w '%{http_code}' \
  -u "$admin_username:$MAUTIC_PASSWORD" \
  -H 'Accept: application/json' \
  "$base_url/api/roles?limit=100")"

if [ "$roles_status" != 200 ]; then
  echo "Mautic role lookup failed (HTTP $roles_status)" >&2
  exit 1
fi

role_id="$(grep -Eo '"id":[0-9]+,"name":"Sales Team"[^}]*"isAdmin":false' "$roles_file" \
  | sed -nE 's/.*"id":([0-9]+).*/\1/p' | head -n 1)"

if [ -z "$role_id" ]; then
  role_id="$(curl -sS -o "$roles_file" -w '%{http_code}' \
    -u "$admin_username:$MAUTIC_PASSWORD" \
    -H 'Accept: application/json' \
    --data-urlencode 'name=Sales Team' \
    --data-urlencode 'isAdmin=0' \
    "$base_url/api/roles/new")"
  role_status="$role_id"
  role_id="$(sed -nE 's/.*"id":([0-9]+).*/\1/p' "$roles_file" | head -n 1)"
  if [ "$role_status" != 201 ] || [ -z "$role_id" ]; then
    echo "Mautic role creation failed (HTTP $role_status)" >&2
    exit 1
  fi
fi

status="$(curl -sS -o "$response_file" -w '%{http_code}' \
  -u "$admin_username:$MAUTIC_PASSWORD" \
  -H 'Accept: application/json' \
  --data-urlencode "username=$new_username" \
  --data-urlencode "email=$new_email" \
  --data-urlencode "firstName=$first_name" \
  --data-urlencode "lastName=$last_name" \
  --data-urlencode "plainPassword[password]=$MAUTIC_REGISTER_PASSWORD" \
  --data-urlencode "plainPassword[confirm]=$MAUTIC_REGISTER_PASSWORD" \
  --data-urlencode "role=$role_id" \
  "$base_url/api/users/new")"

if [ "$status" -lt 200 ] || [ "$status" -ge 300 ] || ! grep -Eq '"username"[[:space:]]*:[[:space:]]*"'"$new_username"'"' "$response_file"; then
  echo "Mautic user creation failed (HTTP $status)" >&2
  exit 1
fi

echo "Mautic user created: $new_username"
