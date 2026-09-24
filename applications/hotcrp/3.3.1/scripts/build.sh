#!/usr/bin/env bash
set -Eeuo pipefail

app_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
image_name="yorem/hotcrp:3.3.1"
tar_path="$app_dir/image/hotcrp-3.3.1-linux-amd64.tar"
mkdir -p "$app_dir/image"

docker build --platform linux/amd64 --file "$app_dir/docker/Dockerfile" \
  --tag "$image_name" "$app_dir"
docker image inspect "$image_name" > "$app_dir/image/image.json"
docker save --output "$tar_path" "$image_name"
(cd "$app_dir" && sha256sum "image/$(basename "$tar_path")" image/image.json > image/SHA256SUMS)
echo "构建完成：$image_name"
echo "镜像归档：$tar_path"
