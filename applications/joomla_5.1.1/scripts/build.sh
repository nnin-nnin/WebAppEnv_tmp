#!/usr/bin/env bash
set -Eeuo pipefail
cd "$(dirname "$0")/.."
docker build --platform linux/amd64 -f docker/Dockerfile -t asteriskax001/sop-joomla:5.1.1 .
docker save --output image/joomla-5.1.1-linux-amd64.tar asteriskax001/sop-joomla:5.1.1
docker image inspect asteriskax001/sop-joomla:5.1.1 > image/image.json
sha256sum image/joomla-5.1.1-linux-amd64.tar image/image.json > image/SHA256SUMS
