#!/usr/bin/env bash
set -euo pipefail

docker run -d --name "${MAUTIC_CONTAINER:-mautic-5-0-4}" -p "${MAUTIC_PORT:-18518}:80" asteriskax001/sop-mautic:5.0.4
