#!/usr/bin/env bash
set -Eeuo pipefail
docker run -d --name "${WORDPRESS_CONTAINER:-wordpress-6-5-3}" -p "${WORDPRESS_PORT:-18513}:80" asteriskax001/sop-wordpress:6.5.3

