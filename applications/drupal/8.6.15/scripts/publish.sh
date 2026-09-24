#!/usr/bin/env bash
set -euo pipefail

LOCAL_IMAGE="${LOCAL_IMAGE:-yorem/drupal:8.6.15}"
PUBLISHED_IMAGE="${PUBLISHED_IMAGE:-yorem/drupal:8.6.15}"

if ! docker image inspect "$LOCAL_IMAGE" >/dev/null 2>&1; then
  echo "Local image is missing: $LOCAL_IMAGE" >&2
  echo "Run scripts/build.sh first." >&2
  exit 1
fi

docker tag "$LOCAL_IMAGE" "$PUBLISHED_IMAGE"
docker push "$PUBLISHED_IMAGE"
echo "Published $PUBLISHED_IMAGE"
