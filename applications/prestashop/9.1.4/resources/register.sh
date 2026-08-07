#!/usr/bin/env bash
set -Eeuo pipefail

if [[ $# -lt 2 || $# -gt 4 ]]; then
  echo "用法：$0 EMAIL PASSWORD [FIRSTNAME] [LASTNAME]" >&2
  exit 2
fi

BASE_URL=${APP_URL:-http://localhost:18401}
BASE_URL=${BASE_URL%/}
EMAIL=$1
PASSWORD=$2
FIRSTNAME=${3:-Benchmark}
LASTNAME=${4:-User}
COOKIE_JAR=$(mktemp)
RESULT_PAGE=$(mktemp)
trap 'rm -f "$COOKIE_JAR" "$RESULT_PAGE"' EXIT

[[ "$EMAIL" == *@*.* ]] || { echo 'EMAIL 不是有效邮箱地址' >&2; exit 2; }
[[ ${#PASSWORD} -ge 8 ]] || { echo 'PASSWORD 至少需要 8 个字符' >&2; exit 2; }

# 这是 PrestaShop 真实的前台注册接口（registration 控制器的 submitCreate 分支），
# 不是通用占位 API。字段名与官方 CustomerForm 保持一致。
curl -fsS -L -b "$COOKIE_JAR" -c "$COOKIE_JAR" \
  -d 'id_gender=0' \
  -d "firstname=$FIRSTNAME" \
  -d "lastname=$LASTNAME" \
  -d "email=$EMAIL" \
  --data-urlencode "password=$PASSWORD" \
  -d 'birthday=' \
  -d 'newsletter=0' \
  -d 'optin=0' \
  -d 'customer_privacy=1' \
  -d 'psgdpr=1' \
  -d 'submitCreate=Create+an+account' \
  "$BASE_URL/registration" -o "$RESULT_PAGE"

if grep -Eqi 'already registered|is invalid|is required|error' "$RESULT_PAGE" && ! grep -Eqi 'my-account|account' "$RESULT_PAGE"; then
  echo 'PrestaShop 普通客户注册失败，请检查返回页面中的校验信息' >&2
  exit 1
fi
grep -Eqi 'my-account|logout|account' "$RESULT_PAGE" || { echo '未确认普通客户注册成功' >&2; exit 1; }
echo "PrestaShop 普通客户创建成功：$EMAIL"
