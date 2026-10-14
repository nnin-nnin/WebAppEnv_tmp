#!/usr/bin/env bash
set -euo pipefail
code=$(curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:18100/user/account/user-name?username=admin" || true)
[[ "$code" == "200" ]]
