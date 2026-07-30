#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
project_dir="$(cd -- "$script_dir/.." && pwd)"
image_dir="$project_dir/image"
archive_path="$image_dir/espocrm-8.2.5-linux-amd64.tar"
metadata_path="$image_dir/image.json"
checksum_path="$image_dir/SHA256SUMS"

mkdir -p "$image_dir"

docker build --platform linux/amd64 --pull=false \
  -f "$project_dir/docker/espocrm.Dockerfile" \
  -t espocrm:8.2.5-base "$project_dir"

docker build --platform linux/amd64 --pull=false \
  -f "$project_dir/docker/espocrm-standalone.Dockerfile" \
  -t espocrm:8.2.5 "$project_dir"

docker save --output "$archive_path" espocrm:8.2.5
docker image inspect espocrm:8.2.5 > "$metadata_path"
sha256sum "$archive_path" "$metadata_path" \
  | sed "s#  $image_dir/#  #" > "$checksum_path"

echo "EspoCRM all-in-one image exported: $archive_path"
