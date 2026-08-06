#!/bin/bash
set -Eeuo pipefail
CONTAINER="${1:-espocrm}"
docker rm -f "$CONTAINER" 2>/dev/null || true
docker volume rm espocrm-data espocrm-db espocrm-custom 2>/dev/null || true
echo '已删除 EspoCRM 容器及其命名卷；重新执行 docker run 将自动初始化。'
