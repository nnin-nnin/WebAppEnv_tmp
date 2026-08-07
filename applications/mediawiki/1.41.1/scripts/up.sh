#!/usr/bin/env bash
set -Eeuo pipefail

docker run --detach --name mediawiki-1.41.1 --publish 18519:80 \
  --volume mediawiki-data:/var/www/html/images \
  --volume mediawiki-db:/var/lib/mysql \
  asteriskax001/sop-mediawiki:1.41.1

