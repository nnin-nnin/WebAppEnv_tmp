#!/usr/bin/env bash
set -Eeuo pipefail

CONTAINER_NAME=${CONTAINER_NAME:-prestashop-914}

echo '此操作会删除本环境的容器和持久化卷：数据库、配置、上传文件和图片。'
if [[ "${1:-}" != --yes ]]; then
  echo '如需执行，请使用：scripts/reset.sh --yes' >&2
  exit 2
fi
docker rm -fv "$CONTAINER_NAME" >/dev/null 2>&1 || true
for volume in prestashop-db prestashop-config prestashop-runtime prestashop-images prestashop-upload prestashop-download; do
  docker volume rm "$volume" >/dev/null 2>&1 || true
done
echo '已重置。重新执行 docker run（建议带 -v 卷映射）即可重新初始化。'
