#!/usr/bin/env bash
set -Eeuo pipefail

docker run --platform linux/amd64 -d -p 18514:80 yorem/glpi:10.0.26

