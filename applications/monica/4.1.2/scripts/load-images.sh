#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
project_dir="$(cd -- "$script_dir/.." && pwd)"
image_dir="$project_dir/image"

cd "$project_dir"
sha256sum -c image/SHA256SUMS

archives=(
  "monica-app-4.1.2-linux-amd64.tar"
  "monica-web-4.1.2-linux-amd64.tar"
  "mariadb-11.4.2-linux-amd64.tar"
  "redis-7.2.5-linux-amd64.tar"
  "mailhog-1.0.1-linux-amd64.tar"
)

for archive in "${archives[@]}"; do
  test -s "$image_dir/$archive"
  echo "Loading $archive"
  docker load -i "$image_dir/$archive"
done

# Older local archives use the build-time sop/* names. Retag them to the
# registry names used by the Compose file after loading, including when the
# registry tag already points to an older local image.
if docker image inspect sop/monica-app:4.1.2 >/dev/null 2>&1; then
  docker tag sop/monica-app:4.1.2 yorem/monica:4.1.2-app
fi
if docker image inspect sop/monica-web:4.1.2 >/dev/null 2>&1; then
  docker tag sop/monica-web:4.1.2 yorem/monica:4.1.2-web
fi

echo "All Monica 4.1.2 service images loaded"
