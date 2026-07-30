#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
project_dir="$(cd -- "$script_dir/.." && pwd)"
image_dir="$project_dir/image"
base_image="mall:1.0.3-base"
frontend_image="mall:1.0.3-frontend"
final_image="nnin/sop-mall:1.0.3"
archive_path="$image_dir/mall-1.0.3-linux-amd64.tar"
metadata_path="$image_dir/image.json"
checksum_path="$image_dir/SHA256SUMS"

mkdir -p "$image_dir"
cd "$project_dir"

if ! docker build --platform linux/amd64 \
  -f "$project_dir/docker/Dockerfile" \
  -t "$base_image" \
  "$project_dir"; then
  if docker image inspect "$base_image" >/dev/null 2>&1; then
    echo "backend build failed; reusing existing $base_image" >&2
  else
    echo "backend build failed and no existing $base_image is available" >&2
    exit 1
  fi
fi

docker build --platform linux/amd64 \
  --target frontend \
  -f "$project_dir/docker/Dockerfile" \
  -t "$frontend_image" \
  "$project_dir"

docker build --platform linux/amd64 \
  -f "$project_dir/docker/standalone.Dockerfile" \
  -t "$final_image" \
  "$project_dir"

docker save --output "$archive_path" "$final_image"
docker image inspect "$final_image" > "$metadata_path"
sha256sum "$archive_path" "$metadata_path" \
  | sed "s#  $project_dir/#  #" > "$checksum_path"

echo "mall all-in-one image exported: $archive_path"
