#!/usr/bin/env bash
set -Eeuo pipefail

base_url="${LIMESURVEY_URL:-http://127.0.0.1:18517}"
base_url="${base_url%/}"
body="$(curl --fail --silent --show-error --location --max-time 15 "$base_url/index.php")"
if ! grep -Eiq 'LimeSurvey|Administration|login' <<<"$body"; then
    echo '公开 HTTP 入口未返回 LimeSurvey 真实登录页面' >&2
    exit 1
fi
echo "LimeSurvey HTTP 健康检查通过：$base_url"
