#!/usr/bin/env bash
set -euo pipefail
code=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:18101/ucenter/getMyInfo" || true)
[[ "$code" == "200" ]]
