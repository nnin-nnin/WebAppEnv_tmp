#!/usr/bin/env bash
set -Eeuo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"

image="asteriskax001/sop-leantime:3.1.4"
archive="image/leantime-3.1.4-linux-amd64.tar"

if [[ -z "${LEANTIME_ADMIN_PASSWORD:-}" ]]; then
    echo '必须通过受控环境变量 LEANTIME_ADMIN_PASSWORD 提供管理员初始化凭据' >&2
    exit 2
fi

mkdir -p image
find source/leantime -type f -print0 | sort -z | xargs -0 sha256sum > source/SHA256SUMS

DOCKER_BUILDKIT=1 docker build \
    --platform linux/amd64 \
    --secret id=leantime_admin_password,env=LEANTIME_ADMIN_PASSWORD \
    --build-arg ADMIN_SECRET_VERSION=leantime-3.1.4-v1 \
    --file docker/Dockerfile \
    --tag "$image" \
    .

rm -f "$archive" image/image.json image/SHA256SUMS
docker save --output "$archive" "$image"
docker image inspect "$image" > image/image.json
sha256sum "$archive" > image/SHA256SUMS
echo "已生成 $archive"
