#!/usr/bin/env bash
set -Eeuo pipefail

container_name=nextcloud-29-0-1
image=yorem/nextcloud:29.0.1
host_port=18522

if docker inspect "$container_name" >/dev/null 2>&1; then
    state=$(docker inspect -f '{{.State.Status}}' "$container_name")
    if [ "$state" != running ]; then
        docker start "$container_name"
    fi
else
    docker run --platform linux/amd64 --name "$container_name" -d -p "$host_port":80 "$image"
fi

for i in {1..30}; do
  if docker exec "$container_name" su -s /bin/sh www-data -c "php /var/www/html/occ status" >/dev/null 2>&1; then
    docker exec -e OC_PASS="WcNext!26-cR7vK2P" "$container_name" su -s /bin/sh www-data -c "php /var/www/html/occ user:resetpassword --password-from-env admin" >/dev/null 2>&1 || true
    break
  fi
  sleep 2
done
