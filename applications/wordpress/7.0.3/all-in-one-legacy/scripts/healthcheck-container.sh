#!/usr/bin/env bash
set -Eeuo pipefail
body_file="$(mktemp)"
trap 'rm -f "$body_file"' EXIT
curl --max-time 5 -L -fsS http://127.0.0.1/ -o "$body_file" 2>/dev/null
grep -Eiq 'wp-includes|wp-content|WordPress' "$body_file"
mariadb-admin --protocol=socket --socket=/run/mysqld/mysqld.sock -uroot ping >/dev/null 2>&1
