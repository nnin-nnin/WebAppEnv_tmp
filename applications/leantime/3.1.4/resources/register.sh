#!/usr/bin/env bash
set -Eeuo pipefail

if [[ $# -lt 2 || $# -gt 4 ]]; then
    echo "用法：LEANTIME_CONTAINER=<容器名> $0 <邮箱> <密码> [角色] [容器名]" >&2
    exit 2
fi

email="$1"
password="$2"
role="${3:-editor}"
container="${4:-${LEANTIME_CONTAINER:-}}"

if [[ ! "$email" =~ ^[^[:space:]@]+@[^[:space:]@]+\.[^[:space:]@]+$ ]]; then
    echo "邮箱格式无效" >&2
    exit 2
fi
if [[ ${#password} -lt 8 ]]; then
    echo "密码至少需要 8 个字符" >&2
    exit 2
fi
if [[ -z "$container" ]]; then
    echo "请通过 LEANTIME_CONTAINER 指定正在运行的容器" >&2
    exit 2
fi

# Leantime 3.1.4 没有公开注册 API；这里调用官方 user:add CLI，创建真实应用用户。
docker exec "$container" php /var/www/html/bin/leantime user:add \
    --email="$email" --password="$password" --role="$role" \
    --client-id=1 --first-name=Registered --last-name=User >/dev/null

echo "Leantime 用户创建成功：${email}（角色：${role}）"
