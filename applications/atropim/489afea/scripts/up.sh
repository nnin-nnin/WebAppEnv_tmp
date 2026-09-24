#!/usr/bin/env bash
set -euo pipefail

image_name="${ATROPIM_IMAGE:-yorem/atropim:489afea}"
container_name="${ATROPIM_CONTAINER:-atropim-489afea}"
host_port="${ATROPIM_PORT:-18083}"

docker rm -f "$container_name" >/dev/null 2>&1 || true
docker run -d \
  --platform linux/amd64 \
  --name "$container_name" \
  -p "${host_port}:80" \
  "$image_name"

docker ps --filter "name=^/${container_name}$"
