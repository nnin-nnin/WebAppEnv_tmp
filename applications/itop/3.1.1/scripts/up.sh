#!/bin/bash
set -Eeuo pipefail
docker run -d --name itop -p 18515:80 \
  -v itop-data:/var/www/html/data \
  -v itop-db:/var/lib/mysql \
  asteriskax001/sop-itop:3.1.1
