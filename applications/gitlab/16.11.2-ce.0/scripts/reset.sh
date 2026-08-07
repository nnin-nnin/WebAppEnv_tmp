#!/usr/bin/env bash
set -Eeuo pipefail

if [[ "${RESET_CONFIRM:-}" != YES ]]; then
  echo 'This removes the GitLab container and its three named volumes. Set RESET_CONFIRM=YES to continue.' >&2
  exit 2
fi

docker rm -f gitlab-16.11.2-ce.0 2>/dev/null || true
docker volume rm \
  gitlab-16.11.2-ce.0-config \
  gitlab-16.11.2-ce.0-logs \
  gitlab-16.11.2-ce.0-data
