#!/usr/bin/env bash
set -Eeuo pipefail

port="${DOLIBARR_PORT:-18525}"
name="${DOLIBARR_CONTAINER:-dolibarr-20.0.4}"
docker run --platform linux/amd64 -d --name "$name" -p "${port}:80" \
  yorem/dolibarr:20.0.4
