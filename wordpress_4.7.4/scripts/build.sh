#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
project_dir="$(cd -- "$script_dir/.." && pwd)"
image_dir="$project_dir/image"
archive_path="$image_dir/wordpress-4.7.4-linux-amd64.tar"
metadata_path="$image_dir/image.json"
checksum_path="$image_dir/SHA256SUMS"

mkdir -p "$image_dir"

docker build --platform linux/amd64 --pull=false \
  -f "$project_dir/docker/Dockerfile" \
  -t wordpress:4.7.4 "$project_dir"

docker save --output "$archive_path" wordpress:4.7.4
docker image inspect wordpress:4.7.4 > "$metadata_path"
sha256sum "$archive_path" "$metadata_path" \
  | sed "s#  $image_dir/#  #" > "$checksum_path"

echo "WordPress all-in-one image exported: $archive_path"
