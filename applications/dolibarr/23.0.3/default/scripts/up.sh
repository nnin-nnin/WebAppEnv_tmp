#!/usr/bin/env bash
set -Eeuo pipefail

port="${DOLIBARR_PORT:-18525}"
name="${DOLIBARR_CONTAINER:-dolibarr-23.0.3}"
docker run --platform linux/amd64 -d --name "$name" -p "${port}:80" \
  yorem/dolibarr:23.0.3
