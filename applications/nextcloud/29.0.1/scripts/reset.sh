#!/usr/bin/env bash
set -Eeuo pipefail

IMAGE=asteriskax001/sop-nextcloud:29.0.1
mapfile -t containers < <(docker ps -aq --filter "ancestor=$IMAGE")
for container in "${containers[@]}"; do
    [[ -n "$container" ]] || continue
    volumes=()
    if [[ "${RESET_VOLUMES:-0}" == 1 ]]; then
        mapfile -t volumes < <(docker inspect --format '{{range .Mounts}}{{if eq .Type "volume"}}{{.Name}}{{"\n"}}{{end}}{{end}}' "$container")
    fi
    docker rm -f "$container" >/dev/null
    for volume in "${volumes[@]}"; do
        [[ -n "$volume" ]] && docker volume rm "$volume" >/dev/null
    done
done
echo "Nextcloud containers reset. Start again with the README docker run command."

