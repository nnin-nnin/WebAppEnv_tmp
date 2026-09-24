#!/usr/bin/env bash
set -Eeuo pipefail

root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
image_name="yorem/opencart:4.0.2-3"
secret_file="${OPENCART_ADMIN_PASSWORD_FILE:-}"
temporary_secret=''

if [ -z "$secret_file" ]; then
    if [ -z "${CODEX_ADMIN_PASSWORD:-}" ]; then
        echo '请通过受控环境提供 CODEX_ADMIN_PASSWORD 或 OPENCART_ADMIN_PASSWORD_FILE。' >&2
        exit 2
    fi
    temporary_secret="$(mktemp)"
    chmod 600 "$temporary_secret"
    printf '%s' "$CODEX_ADMIN_PASSWORD" >"$temporary_secret"
    secret_file="$temporary_secret"
fi
cleanup() {
    if [ -n "$temporary_secret" ]; then
        rm -f "$temporary_secret"
    fi
}
trap cleanup EXIT

cd "$root_dir"
mkdir -p image
docker build --platform linux/amd64 --secret id=opencart_admin_password,src="$secret_file" \
    --tag "$image_name" --file docker/Dockerfile .
docker save --output image/opencart-4.0.2-3-linux-amd64.tar "$image_name"
docker image inspect "$image_name" >image/image.json
sha256sum image/opencart-4.0.2-3-linux-amd64.tar image/image.json >image/SHA256SUMS
