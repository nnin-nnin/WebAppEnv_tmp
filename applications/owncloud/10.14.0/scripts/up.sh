#!/usr/bin/env bash
set -Eeuo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "${ROOT_DIR}"
CONTAINER_NAME="${OWNCLOUD_CONTAINER_NAME:-owncloud-10-14-0}"
docker rm -f "${CONTAINER_NAME}" >/dev/null 2>&1 || true
docker run --platform linux/amd64 -d --name "${CONTAINER_NAME}" -p 18524:80 yorem/owncloud:10.14.0

for i in {1..30}; do
  if docker exec "${CONTAINER_NAME}" occ status >/dev/null 2>&1; then
    docker exec -e OC_PASS="WcOwn!26-iS9nF2L" "${CONTAINER_NAME}" occ user:resetpassword --password-from-env admin >/dev/null 2>&1 || true
    break
  fi
  sleep 2
done
