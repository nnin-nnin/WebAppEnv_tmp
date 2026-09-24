#!/usr/bin/env bash
set -Eeuo pipefail

if [[ $# -lt 3 || $# -gt 4 ]]; then
  echo "用法：$0 <login> <lastname> <password> [firstname]" >&2
  exit 2
fi
NEW_LOGIN="$1"
NEW_LASTNAME="$2"
NEW_PASSWORD="$3"
NEW_FIRSTNAME="${4:-}"
BASE_URL="${DOLIBARR_URL:-http://localhost:${DOLIBARR_PORT:-18527}}"
ADMIN_USER="${DOLIBARR_USER:-admin}"
ADMIN_PASSWORD="${DOLIBARR_PASSWORD:-${DOLIBARR_INITIAL_ADMIN_PASSWORD:-}}"
if [[ -z "$ADMIN_PASSWORD" ]]; then
  echo "注册失败：请通过 DOLIBARR_PASSWORD 或 DOLIBARR_INITIAL_ADMIN_PASSWORD 提供受控管理员密码。" >&2
  exit 2
fi

workdir="$(mktemp -d)"
trap 'rm -rf "$workdir"' EXIT
cookiejar="$workdir/cookies.txt"
loginpage="$workdir/login.html"
userpage="$workdir/user.html"
response="$workdir/response.html"
headers="$workdir/headers.txt"
curl_args=(--fail-with-body --silent --show-error --location --connect-timeout 10 --max-time 40)

curl "${curl_args[@]}" -c "$cookiejar" -b "$cookiejar" "$BASE_URL/" -o "$loginpage"
login_token="$(sed -n 's/.*name="token" value="\([^"]*\)".*/\1/p' "$loginpage" | head -1)"
[[ -n "$login_token" ]] || { echo "注册失败：未找到登录 token。" >&2; exit 1; }
curl "${curl_args[@]}" -c "$cookiejar" -b "$cookiejar" -o "$response" \
  --data-urlencode "token=$login_token" --data-urlencode 'actionlogin=login' \
  --data-urlencode 'loginfunction=loginfunction' --data-urlencode "username=$ADMIN_USER" \
  --data-urlencode "password=$ADMIN_PASSWORD" "$BASE_URL/"

curl "${curl_args[@]}" -c "$cookiejar" -b "$cookiejar" "$BASE_URL/user/card.php?action=create" -o "$userpage"
form_token="$(sed -n 's/.*name="token" value="\([^"]*\)".*/\1/p' "$userpage" | head -1)"
[[ -n "$form_token" ]] || { echo "注册失败：管理员会话无效或未找到创建用户 token。" >&2; exit 1; }

curl --fail-with-body --silent --show-error --location --connect-timeout 10 --max-time 40 \
  -c "$cookiejar" -b "$cookiejar" -D "$headers" -o "$response" \
  --data-urlencode "token=$form_token" --data-urlencode 'action=add' \
  --data-urlencode 'entity=1' --data-urlencode "login=$NEW_LOGIN" \
  --data-urlencode "lastname=$NEW_LASTNAME" --data-urlencode "firstname=$NEW_FIRSTNAME" \
  --data-urlencode "password=$NEW_PASSWORD" --data-urlencode 'admin=0' \
  --data-urlencode 'employee=1' --data-urlencode 'api_key=' \
  "$BASE_URL/user/card.php"
if grep -qiE 'NameNotDefined|LoginNotDefined|already exists|error' "$response" && ! grep -qE 'user/card.php\?id=' "$headers"; then
  echo "注册失败：Dolibarr 拒绝创建普通用户。" >&2
  exit 1
fi
echo "注册成功：$NEW_LOGIN"

