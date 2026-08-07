#!/usr/bin/env bash
set -Eeuo pipefail

port="${DOLIBARR_PORT:-18525}"
name="${DOLIBARR_CONTAINER:-dolibarr-19.0.2}"
docker run -d --name "$name" -p "${port}:80" \
  asteriskax001/sop-dolibarr:19.0.2
