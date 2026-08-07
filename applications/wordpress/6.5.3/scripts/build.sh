#!/usr/bin/env bash
set -Eeuo pipefail

app_dir="$(cd "$(dirname "$0")/.." && pwd)"
cd "$app_dir"
[[ -n "${CODEX_ADMIN_PASSWORD:-}" ]] || { echo 'CODEX_ADMIN_PASSWORD must be supplied through the controlled build environment' >&2; exit 2; }
mkdir -p image
secret_file="$(mktemp)"
trap 'rm -f "$secret_file"' EXIT
chmod 600 "$secret_file"
printf '%s' "$CODEX_ADMIN_PASSWORD" > "$secret_file"

DOCKER_BUILDKIT=1 docker build --platform linux/amd64 \
  --secret "id=wp_admin_password,src=$secret_file" \
  -f docker/Dockerfile -t asteriskax001/sop-wordpress:6.5.3 .
docker save --output image/wordpress-6.5.3-linux-amd64.tar asteriskax001/sop-wordpress:6.5.3
docker image inspect asteriskax001/sop-wordpress:6.5.3 > image/image.json
sha256sum image/wordpress-6.5.3-linux-amd64.tar image/image.json > image/SHA256SUMS

