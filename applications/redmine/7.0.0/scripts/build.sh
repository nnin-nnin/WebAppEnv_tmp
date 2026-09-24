#!/usr/bin/env bash
set -Eeuo pipefail

app_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
cd "$app_dir"
: "${REDMINE_INITIAL_PASSWORD:?Set REDMINE_INITIAL_PASSWORD through the controlled build channel}"
mkdir -p image

docker build --platform linux/amd64 \
  --secret id=admin_password,env=REDMINE_INITIAL_PASSWORD \
  --tag yorem/redmine:7.0.0 \
  --file docker/Dockerfile .
docker save --output image/redmine-7.0.0-linux-amd64.tar yorem/redmine:7.0.0
docker image inspect yorem/redmine:7.0.0 > image/image.json
sha256sum image/redmine-7.0.0-linux-amd64.tar > image/SHA256SUMS

