#!/usr/bin/env bash
set -Eeuo pipefail

root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$root_dir"
image_name="yorem/gitlab:16.11.2-ce.0"
archive="image/gitlab-16.11.2-ce.0-linux-amd64.tar"

docker pull gitlab/gitlab-ce:16.11.2-ce.0
docker build --platform linux/amd64 --file docker/Dockerfile --tag "$image_name" .
docker save --output "$archive" "$image_name"
docker image inspect "$image_name" > image/image.json
sha256sum "$archive" image/image.json > image/SHA256SUMS
