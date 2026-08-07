#!/usr/bin/env bash
set -euo pipefail

container_name="${MAUTIC_CONTAINER:-mautic-5-0-4}"
if ! docker container inspect "$container_name" >/dev/null 2>&1; then
  echo "Container $container_name does not exist"
  exit 0
fi

if [ "${MAUTIC_RESET_CONFIRM:-}" != YES ]; then
  echo "Set MAUTIC_RESET_CONFIRM=YES to remove container $container_name and its writable data" >&2
  exit 2
fi

docker rm -fv "$container_name" >/dev/null
echo "Reset complete; start a new container from the loaded image."
