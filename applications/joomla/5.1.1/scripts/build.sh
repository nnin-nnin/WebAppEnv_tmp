#!/usr/bin/env bash
set -Eeuo pipefail
cd "$(dirname "$0")/.."
docker build --platform linux/amd64 -f docker/Dockerfile -t yorem/joomla:5.1.1 .
docker save --output image/joomla-5.1.1-linux-amd64.tar yorem/joomla:5.1.1
docker image inspect yorem/joomla:5.1.1 > image/image.json
sha256sum image/joomla-5.1.1-linux-amd64.tar image/image.json > image/SHA256SUMS
