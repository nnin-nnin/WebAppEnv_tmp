#!/usr/bin/env bash
set -e
cd "$(dirname "$0")/.."
docker compose -f docker/compose.yaml config --quiet
docker compose -f docker/compose.yaml up -d
bash scripts/healthcheck.sh
