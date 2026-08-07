#!/usr/bin/env bash
set -Eeuo pipefail

name="${REDMINE_CONTAINER:-redmine-5.1.2}"
if docker container inspect "$name" >/dev/null 2>&1; then
  docker rm -fv "$name" >/dev/null
fi
for volume in redmine-files redmine-log redmine-tmp redmine-db; do
  if docker volume inspect "$volume" >/dev/null 2>&1; then
    docker volume rm "$volume" >/dev/null
  fi
done
echo "已重置 $name 及其明确命名的 Redmine 数据卷；下次启动会从镜像内置数据恢复。"
