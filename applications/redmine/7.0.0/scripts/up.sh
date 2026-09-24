#!/usr/bin/env bash
set -Eeuo pipefail

port="${REDMINE_PORT:-18512}"
name="${REDMINE_CONTAINER:-redmine-7.0.0}"
docker run --platform linux/amd64 -d --name "$name" -p "${port}:80" \
  -v redmine-files:/usr/src/redmine/files \
  -v redmine-log:/usr/src/redmine/log \
  -v redmine-tmp:/usr/src/redmine/tmp \
  -v redmine-db:/var/lib/mysql \
  yorem/redmine:7.0.0
