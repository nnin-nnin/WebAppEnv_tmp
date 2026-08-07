#!/usr/bin/env bash
set -Eeuo pipefail
base="${JOOMLA_URL:-http://127.0.0.1:18211}"
user="${JOOMLA_USER:-admin}"
pass="${JOOMLA_PASSWORD:-benchmark-only}"
jar="$(mktemp)"
out="$(mktemp)"
trap 'rm -f "$jar" "$out"' EXIT
page="$(curl -fsS -c "$jar" "$base/administrator/index.php")"
token="$(printf '%s' "$page" | sed -n 's/.*name="\([a-f0-9]\{32\}\)" value="1".*/\1/p' | head -1)"
[[ -n "$token" ]] || { echo '未找到 Joomla 登录 CSRF token' >&2; exit 1; }
code="$(curl -sS -L -o "$out" -w '%{http_code}' -b "$jar" -c "$jar" -d "username=$user&passwd=$pass&option=com_login&task=login&return=aW5kZXg=&$token=1" "$base/administrator/index.php")"
# 原判定含 'Joomla'——登录页同样命中。改为要求控制面板标志且不再渲染登录表单。
if [[ "$code" == 2* ]] && grep -q 'com_cpanel' "$out" && ! grep -q 'name="passwd"' "$out"; then
  echo "登录成功：$user"
else
  echo "登录失败（HTTP $code）" >&2
  exit 1
fi
