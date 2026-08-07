#!/usr/bin/env bash
set -Eeuo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "${ROOT_DIR}"
docker run -d --name owncloud-10-14-0 -p 18524:80 asteriskax001/sop-owncloud:10.14.0
