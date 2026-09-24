#!/usr/bin/env bash
set -Eeuo pipefail

image="yorem/glpi:10.0.15"
container="${GLPI_CONTAINER:-}"
if [[ -z "$container" ]]; then
    candidates=($(docker ps -a --filter "ancestor=$image" --format '{{.ID}}'))
    if [[ "${#candidates[@]}" -ne 1 ]]; then
        echo '请设置 GLPI_CONTAINER 为要重置的 GLPI 容器名或 ID' >&2
        exit 2
    fi
    container="${candidates[0]}"
fi

docker rm --force --volumes "$container"
echo 'GLPI 容器及其匿名数据卷已重置；请重新执行 README 中的 docker run 命令。'

