#!/usr/bin/env bash
set -euo pipefail
docker run -d -p "${JOOMLA_PORT:-18211}:80" --name "${JOOMLA_CONTAINER:-joomla-5-1-1}" yorem/joomla:5.1.1
