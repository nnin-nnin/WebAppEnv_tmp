#!/usr/bin/env bash
set -euo pipefail

container_name="${WORDPRESS_CONTAINER_NAME:-wordpress-4.7.4}"

if docker container inspect "$container_name" >/dev/null 2>&1; then
  docker rm --force --volumes "$container_name"
fi

echo "WordPress container and anonymous runtime volumes removed: $container_name"
