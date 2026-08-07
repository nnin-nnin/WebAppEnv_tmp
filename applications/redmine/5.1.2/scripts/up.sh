#!/usr/bin/env bash
set -Eeuo pipefail

port="${REDMINE_PORT:-18512}"
name="${REDMINE_CONTAINER:-redmine-5.1.2}"
docker run -d --name "$name" -p "${port}:80" \
  -v redmine-files:/usr/src/redmine/files \
  -v redmine-log:/usr/src/redmine/log \
  -v redmine-tmp:/usr/src/redmine/tmp \
  -v redmine-db:/var/lib/mysql \
  asteriskax001/sop-redmine:5.1.2
