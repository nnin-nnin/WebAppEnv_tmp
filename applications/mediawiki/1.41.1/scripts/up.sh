#!/usr/bin/env bash
set -Eeuo pipefail

docker rm -f mediawiki-1.41.1 >/dev/null 2>&1 || true
docker run --platform linux/amd64 --detach --name mediawiki-1.41.1 --publish 18519:80 \
  -v /dev/null:/usr/local/etc/php/conf.d/docker-php-ext-opcache.ini \
  --volume mediawiki-data:/var/www/html/images \
  --volume mediawiki-db:/var/lib/mysql \
  yorem/mediawiki:1.41.1

for i in {1..30}; do
  if docker exec mediawiki-1.41.1 php /var/www/html/maintenance/run.php changePassword --user=Admin --password=WcWiki!26-eJ5sV9B >/dev/null 2>&1; then
    break
  fi
  sleep 1
done

