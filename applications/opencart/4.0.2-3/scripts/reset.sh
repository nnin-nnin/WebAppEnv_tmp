#!/usr/bin/env bash
set -Eeuo pipefail

image_name="asteriskax001/sop-opencart:4.0.2-3"
container_ids="$(docker ps -aq --filter "ancestor=$image_name")"
if [ -n "$container_ids" ]; then
    docker rm -f $container_ids
fi
echo '已移除由 OpenCart 镜像创建的容器；未删除其他镜像或容器。重新执行 README 中的 docker run 即可创建干净环境。'
