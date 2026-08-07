#!/usr/bin/env bash
set -Eeuo pipefail

image="asteriskax001/sop-leantime:3.1.4"
name="${LEANTIME_CONTAINER:-leantime}"
port="${LEANTIME_PORT:-18516}"

docker run -d --name "$name" -p "$port:80" "$image"
echo "Leantime 已启动：容器=$name，地址=http://127.0.0.1:$port"
