#!/bin/bash
set -Eeuo pipefail
docker run -d --platform linux/amd64 --name "${FLUXBB_CONTAINER:-fluxbb-1.5.11}" -p "${FLUXBB_PORT:-18311}:80" yorem/fluxbb:1.5.11
