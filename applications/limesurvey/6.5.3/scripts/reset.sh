#!/usr/bin/env bash
set -Eeuo pipefail

image=asteriskax001/sop-limesurvey:6.5.3
container="${LIMESURVEY_CONTAINER:-}"
if [[ -z "$container" ]]; then
    mapfile -t candidates < <(docker ps -a --filter "ancestor=$image" --format '{{.ID}}')
    if [[ "${#candidates[@]}" -ne 1 ]]; then
        echo '请设置 LIMESURVEY_CONTAINER 为要重置的 LimeSurvey 容器名或 ID' >&2
        exit 2
    fi
    container="${candidates[0]}"
fi
docker rm --force --volumes "$container"
echo 'LimeSurvey 容器及其匿名数据卷已重置；请重新执行 README 中的 docker run 命令。'
