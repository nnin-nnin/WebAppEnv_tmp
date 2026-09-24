#!/usr/bin/env bash
set -Eeuo pipefail

body="$(curl --fail --silent --show-error --max-time 5 http://127.0.0.1/index.php)"
grep -Eiq 'GLPI|login' <<<"$body"

