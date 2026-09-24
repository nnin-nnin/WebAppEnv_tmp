#!/usr/bin/env bash
set -Eeuo pipefail
docker run --platform linux/amd64 -d -p 18517:80 yorem/limesurvey:6.5.3
