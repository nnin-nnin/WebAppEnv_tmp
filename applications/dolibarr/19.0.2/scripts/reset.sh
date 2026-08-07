#!/usr/bin/env bash
set -Eeuo pipefail

IMAGE='asteriskax001/sop-dolibarr:19.0.2'
CONTAINER="${1:-dolibarr-19.0.2}"
if ! docker inspect "$CONTAINER" >/dev/null 2>&1; then
  echo "未找到容器 $CONTAINER。"
  exit 0
fi
docker rm --force --volumes "$CONTAINER" >/dev/null
echo "已删除容器 $CONTAINER 及其匿名数据卷；重新运行 $IMAGE 将恢复初始环境。"

