#!/usr/bin/env bash
set -euo pipefail

container_name="${ESPOCRM_CONTAINER:-espocrm-8.2.5}"

docker rm -fv "$container_name" >/dev/null 2>&1 || true
echo "EspoCRM state reset"
