#!/usr/bin/env bash
set -euo pipefail
container="${JOOMLA_CONTAINER:-joomla-5-1-1}"
docker rm -fv "$container" >/dev/null 2>&1 || true
echo "容器已删除；使用 docker run 命令可重新创建 Joomla 环境。若使用命名卷，请另行删除该卷以清空数据。"
