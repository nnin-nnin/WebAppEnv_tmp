#!/bin/bash
set -Eeuo pipefail
docker run -d --name "${FLUXBB_CONTAINER:-fluxbb-1.5.11}" -p "${FLUXBB_PORT:-18311}:80" asteriskax001/sop-fluxbb:1.5.11
