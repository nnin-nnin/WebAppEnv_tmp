#!/usr/bin/env bash
set -Eeuo pipefail
docker run --platform linux/amd64 -d --name "${WORDPRESS_CONTAINER:-wordpress-6-7-6}" -p "${WORDPRESS_PORT:-18513}:80" yorem/wordpress:6.7.6

