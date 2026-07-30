#!/usr/bin/env bash
set -euo pipefail

container_name="${MALL_CONTAINER:-mall-1.0.3}"
image_name="${MALL_IMAGE:-nnin/sop-mall:1.0.3}"

if [[ "$container_name" == mall-1.0.3 ]]; then
  container_ids="$(docker ps -aq --filter "ancestor=$image_name")"
else
  container_ids="$(docker ps -aq --filter "name=^/${container_name}$")"
fi
if [[ -n "$container_ids" ]]; then
  docker rm -fv $container_ids >/dev/null
fi

for volume in mall_1_0_3_mysql mall_1_0_3_redis mall_1_0_3_logs; do
  docker volume rm "$volume" >/dev/null 2>&1 || true
done

echo "mall state reset; run the documented docker run command or scripts/up.sh to recover"
