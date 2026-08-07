#!/usr/bin/env bash
set -Eeuo pipefail

CHECK_URL="${OWNCLOUD_URL:-http://127.0.0.1:18524}"
status_body="$(curl -fsS --max-time 10 "${CHECK_URL%/}/status.php")"
printf '%s\n' "${status_body}" | grep -Eq '"installed"[[:space:]]*:[[:space:]]*true'
printf 'ownCloud HTTP health check passed: %s\n' "${CHECK_URL%/}"
