#!/usr/bin/env bash
set -Eeuo pipefail

container_name="${HOTCRP_CONTAINER_NAME:-hotcrp}"
db_volume="${HOTCRP_DB_VOLUME:-hotcrp-db}"
docs_volume="${HOTCRP_DOCS_VOLUME:-hotcrp-docs}"
if [[ "${HOTCRP_RESET_CONFIRM:-}" != "yes" ]]; then
  echo "此操作会删除容器 $container_name 及明确指定的卷 $db_volume、$docs_volume。" >&2
  echo "确认方式：HOTCRP_RESET_CONFIRM=yes $0" >&2
  exit 2
fi
docker rm -f "$container_name" >/dev/null 2>&1 || true
docker volume rm "$db_volume" "$docs_volume" >/dev/null
echo "已重置 HotCRP 数据。恢复方式："
echo "docker run -d --name $container_name -p 18403:80 -v $db_volume:/var/lib/mysql -v $docs_volume:/var/www/html/docs asteriskax001/sop-hotcrp:3.3.1"
