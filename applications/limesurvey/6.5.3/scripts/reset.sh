#!/usr/bin/env bash
set -Eeuo pipefail

image=yorem/limesurvey:6.5.3
container="${LIMESURVEY_CONTAINER:-}"
if [[ -z "$container" ]]; then
    candidates=($(docker ps -a --filter "ancestor=$image" --format '{{.ID}}'))

    if [[ "${#candidates[@]}" -eq 0 ]]; then
        candidates=($(docker ps -a --filter "publish=18517" --format '{{.ID}}'))
    fi
    if [[ "${#candidates[@]}" -gt 0 ]]; then
        container="${candidates[0]}"
    fi
fi
if [[ -n "${container:-}" ]] && docker inspect "$container" >/dev/null 2>&1; then
    docker rm --force --volumes "$container"
    echo 'LimeSurvey 容器及其匿名数据卷已重置。'
else
    echo '未找到 LimeSurvey 容器。'
fi
