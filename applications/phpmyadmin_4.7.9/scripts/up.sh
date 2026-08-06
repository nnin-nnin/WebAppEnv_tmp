#!/usr/bin/env bash
set -euo pipefail

IMAGE="asteriskax001/sop-phpmyadmin:4.7.9"
PORT="${PMA_PORT:-18379}"
exec docker run -d --name "${PMA_CONTAINER:-phpmyadmin-4.7.9}" -p "$PORT:80" "$IMAGE"
