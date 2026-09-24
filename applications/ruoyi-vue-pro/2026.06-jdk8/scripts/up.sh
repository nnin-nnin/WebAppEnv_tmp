#!/usr/bin/env bash
set -Eeuo pipefail

container_name="${RUOYI_CONTAINER_NAME:-ruoyi-vue-pro}"
port="${RUOYI_PORT:-18087}"
image="yorem/ruoyi-vue-pro:2026.06-jdk8"

docker run --platform linux/amd64 -d --name "$container_name" -p "$port:80" "$image"
echo "容器已启动：${container_name}，访问 http://127.0.0.1:${port}/"
