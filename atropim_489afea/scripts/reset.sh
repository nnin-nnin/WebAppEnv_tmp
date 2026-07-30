#!/usr/bin/env bash
set -euo pipefail

container_name="${ATROPIM_CONTAINER:-atropim-489afea}"

docker rm -fv "$container_name" >/dev/null 2>&1 || true
echo "AtroPIM state reset"
