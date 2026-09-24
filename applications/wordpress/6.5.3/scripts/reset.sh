#!/usr/bin/env bash
set -Eeuo pipefail
name="${WORDPRESS_CONTAINER:-wordpress-6-5-3}"
docker rm -f "$name" >/dev/null 2>&1 || true
echo "已重置并清理容器：$name"

