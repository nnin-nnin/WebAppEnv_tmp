#!/usr/bin/env bash
set -Eeuo pipefail

container=${MINTHCM_CONTAINER:-minthcm-4-0-4}
if docker container inspect "$container" >/dev/null 2>&1; then
    docker rm -f "$container" >/dev/null
    printf '已删除容器 %s；未删除 Docker volume。\n' "$container"
else
    printf '未找到容器 %s。\n' "$container"
fi
printf '恢复方式：docker run --name %s -d -p 18520:80 asteriskax001/sop-minthcm:4.0.4\n' "$container"
printf '若还需清空持久化卷，请先明确指定 MINTHCM_RESET_VOLUMES=1 并手动处理对应卷。\n'
