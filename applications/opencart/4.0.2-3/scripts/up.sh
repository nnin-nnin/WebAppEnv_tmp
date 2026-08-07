#!/usr/bin/env bash
set -Eeuo pipefail

docker run -d --name opencart-4-0-2-3 -p 18523:80 asteriskax001/sop-opencart:4.0.2-3
