#!/usr/bin/env bash
set -Eeuo pipefail

container="${MEDIAWIKI_CONTAINER:-mediawiki-1.41.1}"
docker exec "$container" /usr/local/bin/mediawiki-reset
docker stop --time 30 "$container" >/dev/null
docker start "$container" >/dev/null
echo "已重置 $container；请等待容器健康后重新登录。"
