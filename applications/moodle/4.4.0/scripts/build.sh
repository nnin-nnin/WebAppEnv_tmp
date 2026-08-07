#!/usr/bin/env bash
set -Eeuo pipefail

app_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
image_name='asteriskax001/sop-moodle:4.4.0'
secret_file="$(mktemp)"
cleanup() { rm -f "$secret_file"; }
trap cleanup EXIT

if [[ -z "${MOODLE_ADMIN_PASSWORD:-}" ]]; then
    echo 'MOODLE_ADMIN_PASSWORD must be supplied through the controlled credential channel for the image seed.' >&2
    exit 2
fi
umask 077
printf '%s' "$MOODLE_ADMIN_PASSWORD" > "$secret_file"
mkdir -p "$app_root/image"
docker build --platform linux/amd64 \
    --secret "id=moodle_admin_password,src=${secret_file}" \
    --file "$app_root/docker/Dockerfile" \
    --tag "$image_name" "$app_root"
docker save --output "$app_root/image/moodle-4.4.0-linux-amd64.tar" "$image_name"
docker image inspect "$image_name" > "$app_root/image/image.json"
(cd "$app_root" && sha256sum image/moodle-4.4.0-linux-amd64.tar image/image.json > image/SHA256SUMS)
echo 'Moodle all-in-one image built and exported.'
