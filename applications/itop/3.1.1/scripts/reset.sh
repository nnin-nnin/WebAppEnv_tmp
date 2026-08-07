#!/bin/bash
set -Eeuo pipefail
docker rm -f itop >/dev/null 2>&1 || true
docker volume rm itop-data itop-db >/dev/null 2>&1 || true
echo 'iTop 容器及其标准持久化卷已重置；请按 README 的启动命令重新运行。'
