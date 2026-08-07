#!/usr/bin/env bash
set -Eeuo pipefail

ROOT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
IMAGE_NAME=asteriskax001/sop-prestashop:9.1.4
BASE_IMAGE=php:8.3.33-apache-bookworm
BASE_DIGEST=sha256:973e11c67c1c81e7811077a0efa0f910cf903af0ba972cab6ba0c0e15913c771

cd "$ROOT_DIR"
mkdir -p image

if ! docker image inspect "$BASE_IMAGE" >/dev/null 2>&1; then
  if docker image inspect "$BASE_DIGEST" >/dev/null 2>&1; then
    docker tag "$BASE_DIGEST" "$BASE_IMAGE"
  else
    docker pull "$BASE_IMAGE"
  fi
fi

docker build --platform linux/amd64 --build-arg BASE_IMAGE="$BASE_IMAGE" --tag "$IMAGE_NAME" --file docker/Dockerfile .
docker save --output image/prestashop-9.1.4-linux-amd64.tar "$IMAGE_NAME"
docker image inspect "$IMAGE_NAME" --format '{"image":"{{.RepoTags}}","id":"{{.Id}}","created":"{{.Created}}","architecture":"{{.Architecture}}","os":"{{.Os}}","size":{{.Size}}}' > image/image.json
sha256sum image/prestashop-9.1.4-linux-amd64.tar image/image.json > image/SHA256SUMS
echo "已生成 $IMAGE_NAME 和 image/prestashop-9.1.4-linux-amd64.tar"
