#!/usr/bin/env bash
set -Eeuo pipefail

docker run -d -p 18514:80 asteriskax001/sop-glpi:10.0.15

