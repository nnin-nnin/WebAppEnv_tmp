#!/bin/bash
set -e

HOST_PORT="${HOST_PORT:-18001}"
USERNAME="${ADMIN_USERNAME:-admin}"
PASSWORD="${ADMIN_PASSWORD:-benchmark-only}"
URL="http://localhost:${HOST_PORT}/index.php?rt=index/login&s=admin"

echo "Attempting admin login to AbanteCart at http://localhost:${HOST_PORT}..."

COOKIE_FILE=$(mktemp)
trap 'rm -f "$COOKIE_FILE"' EXIT

RESPONSE=$(curl -s -c "$COOKIE_FILE" -b "$COOKIE_FILE" -L \
  -d "username=${USERNAME}" \
  -d "password=${PASSWORD}" \
  "$URL")

if echo "$RESPONSE" | grep -q -i "Dashboard" && echo "$RESPONSE" | grep -q "token="; then
    echo "SUCCESS: Admin login and dashboard closure successful for ${USERNAME}!"
    exit 0
else
    echo "RESPONSE snippet:"
    echo "$RESPONSE" | head -n 30
    echo "FAILED: Login validation failed!"
    exit 1
fi
