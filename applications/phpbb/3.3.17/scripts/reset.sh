#!/bin/bash
set -e
cd "$(dirname "$0")/../docker"
docker compose down -v --remove-orphans
echo "Reset complete."
