#!/usr/bin/env bash
set -euo pipefail

CONTAINER="${PMA_CONTAINER:-phpmyadmin-4.7.9}"
if [ "${RESET_CONFIRM:-}" != "YES" ]; then
    echo "此操作会删除 $CONTAINER 的数据库卷；请设置 RESET_CONFIRM=YES 后重试" >&2
    exit 2
fi

volume="$(docker inspect --format '{{range .Mounts}}{{if eq .Destination "/var/lib/mysql"}}{{.Name}}{{end}}{{end}}' "$CONTAINER")"
if [ -z "$volume" ]; then
    echo "未找到 /var/lib/mysql 数据卷：$CONTAINER" >&2
    exit 1
fi
docker stop "$CONTAINER" >/dev/null
docker rm "$CONTAINER" >/dev/null
docker volume rm "$volume" >/dev/null
echo "已重置数据库卷：$volume"
echo "请重新执行 README 中的 docker run 命令以自动初始化 admin/benchmark-only。"
