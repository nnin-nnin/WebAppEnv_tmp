#!/usr/bin/env bash
set -Eeuo pipefail
CONTAINER="${WORDPRESS_CONTAINER:-wordpress-6-7-6}"
if ! docker inspect "$CONTAINER" >/dev/null 2>&1; then
  candidates=($(docker ps -a --filter "name=wordpress" --format '{{.ID}}'))
  if [[ "${#candidates[@]}" -gt 0 ]]; then
    CONTAINER="${candidates[0]}"
  fi
fi
if docker inspect "$CONTAINER" >/dev/null 2>&1; then
  docker rm --force --volumes "$CONTAINER" >/dev/null
  echo "WordPress 容器 $CONTAINER 已重置并删除。"
else
  echo "未找到 WordPress 容器 $CONTAINER。"
fi

