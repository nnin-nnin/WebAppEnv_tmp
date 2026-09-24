#!/usr/bin/env bash
set -Eeuo pipefail

app_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
image_name='yorem/mediawiki:1.41.1'
archive="$app_dir/image/mediawiki-1.41.1-linux-amd64.tar"

if [[ -z "${MEDIAWIKI_ADMIN_PASSWORD:-}" ]]; then
  echo '请通过受控环境变量 MEDIAWIKI_ADMIN_PASSWORD 提供管理员密码后再构建。' >&2
  exit 2
fi

mkdir -p "$app_dir/image"
docker build --platform linux/amd64 \
  --secret id=mediawiki_admin_password,env=MEDIAWIKI_ADMIN_PASSWORD \
  --tag "$image_name" --file "$app_dir/docker/Dockerfile" "$app_dir"
docker save --output "$archive" "$image_name"
docker image inspect "$image_name" > "$app_dir/image/image.json"
sha256sum "$archive" > "$app_dir/image/SHA256SUMS"

