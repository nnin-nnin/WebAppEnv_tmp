#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
IMAGE_DIR="$ROOT_DIR/image"
APP_IMAGE="sop/drupal:8.6.15"
PUBLISHED_APP_IMAGE="yorem/sop-drupal:8.6.15"
DB_IMAGE="postgres:10.23-bullseye"
BASE_IMAGE="docker.io/library/drupal:8.6.15-apache@sha256:6494e8cdd709bed5f6cb8452611ece78d239a4bba47ff199cf768bb36b1e9753"

cd "$ROOT_DIR"
docker build --platform linux/amd64 \
  --build-arg "BASE_IMAGE=$BASE_IMAGE" \
  -f docker/Dockerfile \
  -t "$APP_IMAGE" \
  .

docker tag "$APP_IMAGE" "$PUBLISHED_APP_IMAGE"

docker pull --platform linux/amd64 "$DB_IMAGE"

mkdir -p "$IMAGE_DIR"
docker save --platform linux/amd64 \
  --output "$IMAGE_DIR/drupal-app-8.6.15-linux-amd64.tar" \
  "$APP_IMAGE"
docker save --platform linux/amd64 \
  --output "$IMAGE_DIR/postgres-10.23-linux-amd64.tar" \
  "$DB_IMAGE"

app_id="$(docker image inspect "$APP_IMAGE" --format '{{.Id}}')"
db_id="$(docker image inspect "$DB_IMAGE" --format '{{.Id}}')"

jq -n \
  --arg app_image "$PUBLISHED_APP_IMAGE" \
  --arg local_app_image "$APP_IMAGE" \
  --arg app_id "$app_id" \
  --arg db_image "$DB_IMAGE" \
  --arg db_id "$db_id" \
  --arg base_image "$BASE_IMAGE" \
  '{
    delivery_method: "DOCKER_HUB",
    platform: "linux/amd64",
    base_image: $base_image,
    images: [
      {service:"application", image:$app_image, local_tag:$local_app_image, tag:"8.6.15", digest:$app_id, platform:"linux/amd64", source:"Docker Hub", local_archive:"image/drupal-app-8.6.15-linux-amd64.tar"},
      {service:"installer", image:$app_image, local_tag:$local_app_image, tag:"8.6.15", digest:$app_id, platform:"linux/amd64", source:"Docker Hub", local_archive:"image/drupal-app-8.6.15-linux-amd64.tar"},
      {service:"db", image:$db_image, tag:"10.23-bullseye", digest:$db_id, platform:"linux/amd64", source:"Docker Hub official image", local_archive:"image/postgres-10.23-linux-amd64.tar"}
    ],
    local_archives: "Generated only when scripts/build.sh is run locally"
  }' > "$IMAGE_DIR/image.json"

(cd "$IMAGE_DIR" && sha256sum *.tar image.json > SHA256SUMS)

echo "Built and archived Drupal 8.6.15 linux/amd64 service images"
