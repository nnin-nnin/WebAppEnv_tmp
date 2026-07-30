#!/usr/bin/env bash
set -euo pipefail

image_name="${MALL_IMAGE:-nnin/sop-mall:1.0.3}"
container_name="${MALL_CONTAINER:-mall-1.0.3}"
host_port="${MALL_PORT:-18085}"

docker rm -f "$container_name" >/dev/null 2>&1 || true
docker run -d \
  --platform linux/amd64 \
  --name "$container_name" \
  -p "${host_port}:80" \
  -v mall_1_0_3_mysql:/var/lib/mysql \
  -v mall_1_0_3_redis:/var/lib/redis \
  -v mall_1_0_3_logs:/var/log/mall \
  "$image_name"

docker ps --filter "name=^/${container_name}$"
