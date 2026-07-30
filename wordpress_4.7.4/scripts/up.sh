#!/usr/bin/env bash
set -euo pipefail

docker run -d \
  --platform linux/amd64 \
  --name "${WORDPRESS_CONTAINER_NAME:-wordpress-4.7.4}" \
  -p "${WORDPRESS_HOST_PORT:-18084}:80" \
  nnin/sop-wordpress:4.7.4
