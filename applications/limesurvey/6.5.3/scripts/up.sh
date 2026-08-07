#!/usr/bin/env bash
set -Eeuo pipefail
docker run -d -p 18517:80 asteriskax001/sop-limesurvey:6.5.3
