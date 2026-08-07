#!/usr/bin/env bash
set -Eeuo pipefail

container_name="${HOTCRP_CONTAINER_NAME:-hotcrp}"
db_volume="${HOTCRP_DB_VOLUME:-hotcrp-db}"
docs_volume="${HOTCRP_DOCS_VOLUME:-hotcrp-docs}"
port="${HOTCRP_PORT:-18403}"

docker run -d \
  --name "$container_name" \
  -p "$port:80" \
  -v "$db_volume:/var/lib/mysql" \
  -v "$docs_volume:/var/www/html/docs" \
  asteriskax001/sop-hotcrp:3.3.1
