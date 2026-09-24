#!/usr/bin/env bash
set -Eeuo pipefail
docker run --platform linux/amd64 -d --name "${WORDPRESS_CONTAINER:-wordpress-7-0-3}" -p "${WORDPRESS_PORT:-18513}:80" yorem/wordpress:7.0.3-aio

