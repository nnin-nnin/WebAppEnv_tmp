#!/usr/bin/env bash
set -Eeuo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "${ROOT_DIR}"

: "${CODEX_ADMIN_PASSWORD:?受控构建渠道未提供管理员密码}"
mkdir -p image

docker build --platform linux/amd64 --provenance=false \
  --secret id=admin_password,env=CODEX_ADMIN_PASSWORD \
  --tag asteriskax001/sop-owncloud:10.14.0 \
  --file docker/Dockerfile .

docker save --output image/owncloud-10.14.0-linux-amd64.tar asteriskax001/sop-owncloud:10.14.0
docker image inspect asteriskax001/sop-owncloud:10.14.0 > image/image.json
sha256sum image/owncloud-10.14.0-linux-amd64.tar image/image.json > image/SHA256SUMS
