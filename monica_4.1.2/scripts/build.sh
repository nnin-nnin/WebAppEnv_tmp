#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
project_dir="$(cd -- "$script_dir/.." && pwd)"
image_dir="$project_dir/image"

app_image="yorem/sop-monica-app:4.1.2"
web_image="yorem/sop-monica-web:4.1.2"
db_image="mariadb:11.4.2"
redis_image="redis:7.2.5-alpine"
mail_image="mailhog/mailhog:v1.0.1"

cd "$project_dir"
docker build --platform linux/amd64 -f docker/Dockerfile -t "$app_image" .
docker build --platform linux/amd64 \
  --build-arg "APP_IMAGE=$app_image" \
  -f docker/web.Dockerfile -t "$web_image" .

docker pull --platform linux/amd64 "$db_image"
docker pull --platform linux/amd64 "$redis_image"
docker pull --platform linux/amd64 "$mail_image"

mkdir -p "$image_dir"
docker save --output "$image_dir/monica-app-4.1.2-linux-amd64.tar" "$app_image"
docker save --output "$image_dir/monica-web-4.1.2-linux-amd64.tar" "$web_image"
docker save --output "$image_dir/mariadb-11.4.2-linux-amd64.tar" "$db_image"
docker save --output "$image_dir/redis-7.2.5-linux-amd64.tar" "$redis_image"
docker save --output "$image_dir/mailhog-1.0.1-linux-amd64.tar" "$mail_image"

inspect_image() {
  local service="$1"
  local image="$2"
  local archive="$3"
  local json
  json="$(docker image inspect "$image")"
  local id
  local repo_digest
  local architecture
  local os
  id="$(jq -r '.[0].Id' <<<"$json")"
  repo_digest="$(jq -r '.[0].RepoDigests[0] // empty' <<<"$json")"
  architecture="$(jq -r '.[0].Architecture' <<<"$json")"
  os="$(jq -r '.[0].Os' <<<"$json")"
  if [[ -z "$repo_digest" ]]; then
    repo_digest="$id"
  fi
  jq -n \
    --arg service "$service" \
    --arg image "$image" \
    --arg tag "${image##*:}" \
    --arg id "$id" \
    --arg digest "$repo_digest" \
    --arg platform "$os/$architecture" \
    --arg archive "image/$archive" \
    '{service:$service,image:$image,tag:$tag,id:$id,digest:$digest,platform:$platform,archive:$archive}'
}

app_json="$(inspect_image app "$app_image" monica-app-4.1.2-linux-amd64.tar)"
web_json="$(inspect_image web "$web_image" monica-web-4.1.2-linux-amd64.tar)"
db_json="$(inspect_image db "$db_image" mariadb-11.4.2-linux-amd64.tar)"
redis_json="$(inspect_image redis "$redis_image" redis-7.2.5-linux-amd64.tar)"
mail_json="$(inspect_image mail "$mail_image" mailhog-1.0.1-linux-amd64.tar)"
jq -n \
  --argjson app "$app_json" \
  --argjson web "$web_json" \
  --argjson db "$db_json" \
  --argjson redis "$redis_json" \
  --argjson mail "$mail_json" \
  '[$app, $web, $db, $redis, {service:"cron",image:$app.image,tag:$app.tag,id:$app.id,digest:$app.digest,platform:$app.platform,archive:$app.archive}, {service:"queue",image:$app.image,tag:$app.tag,id:$app.id,digest:$app.digest,platform:$app.platform,archive:$app.archive}, $mail]' \
  > "$image_dir/image.json"

sha256sum image/*.tar image/image.json | sed "s#  $project_dir/#  #" > image/SHA256SUMS

echo "Built and archived Monica 4.1.2 linux/amd64 service images"
