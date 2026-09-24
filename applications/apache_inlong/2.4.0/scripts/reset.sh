#!/usr/bin/env bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PROJECT_DIR="$DIR/.."

cd "$PROJECT_DIR"
docker compose -p apache-inlong-2-4-0 -f docker/compose.yaml down -v
