#!/usr/bin/env bash
set -Eeuo pipefail

ROOT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
BASE_IMAGE=yorem/minthcm:4.0.4-base
FINAL_IMAGE=yorem/minthcm:4.0.4
INIT_NAME=minthcm-build-init-4-0-4
TAR_PATH="${ROOT_DIR}/image/minthcm-4.0.4-linux-amd64.tar"

: "${MINTHCM_ADMIN_PASSWORD:?Set MINTHCM_ADMIN_PASSWORD only through the controlled build environment.}"

cd "${ROOT_DIR}"
bash -n scripts/*.sh
docker build --platform linux/amd64 --pull=false -f docker/Dockerfile -t "${BASE_IMAGE}" .

docker rm -f "${INIT_NAME}" >/dev/null 2>&1 || true
init_id=$(docker run -d --platform linux/amd64 --name "${INIT_NAME}" -e MINTHCM_ADMIN_PASSWORD "${BASE_IMAGE}")
init_ok=0
for _ in $(seq 1 180); do
    state=$(docker inspect -f '{{.State.Status}}' "${INIT_NAME}" 2>/dev/null || true)
    if [ "${state}" != running ]; then break; fi
    if docker exec "${INIT_NAME}" bash -c 'test -f /var/www/MintHCM/.minthcm-installed && test -s /var/www/MintHCM/legacy/config.php' >/dev/null 2>&1; then
        init_ok=1
        break
    fi
    sleep 2
done
if [ "${init_ok}" -ne 1 ]; then
    docker inspect "${INIT_NAME}" --format 'initialization state: {{.State.Status}} exit={{.State.ExitCode}}' >&2 || true
    exit 1
fi

docker exec "${INIT_NAME}" bash -c 'rm -f /var/www/MintHCM/configMint4 /var/www/MintHCM/install.log /var/log/minthcm/install.log /var/www/MintHCM/index.php'
docker stop -t 15 "${INIT_NAME}" >/dev/null
docker commit \
    --change 'ENV MINTHCM_ADMIN_PASSWORD=' \
    --change 'ENV MINTHCM_ADMIN_PASSWORD_FILE=' \
    "${INIT_NAME}" "${FINAL_IMAGE}" >/dev/null
docker rm "${INIT_NAME}" >/dev/null

mkdir -p image
docker image inspect "${FINAL_IMAGE}" > image/image.json
rm -f "${TAR_PATH}"
docker save --output "${TAR_PATH}" "${FINAL_IMAGE}"
(cd image && sha256sum "$(basename "${TAR_PATH}")" image.json > SHA256SUMS)

unset MINTHCM_ADMIN_PASSWORD
printf 'Built %s\nArchive: %s\n' "${FINAL_IMAGE}" "${TAR_PATH}"
