#!/usr/bin/env bash
set -euo pipefail

image_name="${ESPOCRM_IMAGE:-yorem/espocrm:10.0.3}"
container_name="${ESPOCRM_CONTAINER:-espocrm-8.2.5}"
host_port="${ESPOCRM_PORT:-18092}"

docker rm -f "$container_name" >/dev/null 2>&1 || true
docker run -d \
  --platform linux/amd64 \
  --name "$container_name" \
  -p "${host_port}:80" \
  "$image_name"

docker ps --filter "name=^/${container_name}$"
