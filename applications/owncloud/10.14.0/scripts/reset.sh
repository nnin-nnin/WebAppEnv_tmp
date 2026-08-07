#!/usr/bin/env bash
set -Eeuo pipefail

CONTAINER_NAME="${OWNCLOUD_CONTAINER_NAME:-owncloud-10-14-0}"
docker rm -f "${CONTAINER_NAME}"
printf '已移除容器 %s。使用 Compose 或显式挂载命名卷时，卷中的数据仍会保留；直接 docker run 未挂载卷时，数据随容器移除。\n' "${CONTAINER_NAME}"
printf '%s\n' '恢复方式：重新执行 README.md“启动”章节中的 docker run 命令；需要跨容器保留数据时请使用 docker/compose.yaml 的 owncloud-data 和 owncloud-db 卷。'
