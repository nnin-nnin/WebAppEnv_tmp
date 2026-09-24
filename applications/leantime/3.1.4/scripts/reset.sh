#!/usr/bin/env bash
set -Eeuo pipefail

container="${1:-${LEANTIME_CONTAINER:-leantime}}"
if ! docker container inspect "$container" >/dev/null 2>&1; then
    echo "找不到容器：$container"
    exit 0
fi

echo "正在删除 Leantime 容器及其匿名数据卷：$container"
docker rm --force --volumes "$container" >/dev/null
echo "重置完成。请重新执行 README 中的 docker run 命令。"
