#!/usr/bin/env bash
set -Eeuo pipefail

if [[ "$#" -lt 1 || "$#" -gt 2 ]]; then
    echo "用法：LIMESURVEY_PASSWORD=... LIMESURVEY_NEW_PASSWORD=... $0 用户名 [邮箱]" >&2
    exit 2
fi
username="$1"
email="${2:-${username}@example.invalid}"
if [[ ! "$username" =~ ^[A-Za-z0-9._-]{1,80}$ || ! "$email" =~ ^[^[:space:]\"]+@[^[:space:]\"]+$ ]]; then
    echo '用户名或邮箱格式不符合要求' >&2
    exit 2
fi
: "${LIMESURVEY_PASSWORD:?请通过受控环境变量 LIMESURVEY_PASSWORD 提供管理员密码}"
: "${LIMESURVEY_NEW_PASSWORD:?请通过受控环境变量 LIMESURVEY_NEW_PASSWORD 提供新用户密码}"
if [[ ! "$LIMESURVEY_NEW_PASSWORD" =~ ^[A-Za-z0-9@#%+_=-]{8,128}$ ]]; then
    echo 'LIMESURVEY_NEW_PASSWORD 必须为 8-128 个安全字符（不含引号和反斜杠）' >&2
    exit 2
fi

base_url="${LIMESURVEY_URL:-http://127.0.0.1:18517}"
base_url="${base_url%/}"
tmp_dir="$(mktemp -d)"
trap 'rm -rf "$tmp_dir"' EXIT

curl --fail --silent --show-error --location --max-time 15 \
    --cookie-jar "$tmp_dir/cookies" --output "$tmp_dir/login.html" \
    "$base_url/index.php?r=admin/authentication/sa/login"
csrf_token="$(grep -Eo 'value="[^"]+" name="YII_CSRF_TOKEN"' "$tmp_dir/login.html" | sed -E 's/^value="([^"]+)".*/\1/' | head -n 1)"
[[ -n "$csrf_token" ]] || { echo 'LimeSurvey 登录页面缺少 CSRF token' >&2; exit 1; }
login_status="$(curl --silent --show-error --max-time 15 \
    --cookie "$tmp_dir/cookies" --cookie-jar "$tmp_dir/cookies" \
    --output "$tmp_dir/admin.html" --write-out '%{http_code}' \
    --request POST "$base_url/index.php?r=admin/authentication/sa/login" \
    --data-urlencode "YII_CSRF_TOKEN=$csrf_token" \
    --data-urlencode 'user=admin' --data-urlencode "password=$LIMESURVEY_PASSWORD" \
    --data-urlencode 'authMethod=Authdb' --data-urlencode 'action=login' \
    --data-urlencode 'login_submit=login' --data-urlencode 'loginlang=en')"
if [[ "$login_status" != 2* && "$login_status" != 3* ]] || grep -Eiq 'name="user"|Invalid username|Invalid password|Authentication failed' "$tmp_dir/admin.html"; then
    echo "LimeSurvey 管理员认证失败（HTTP $login_status）" >&2
    exit 1
fi
curl --fail --silent --show-error --location --max-time 15 \
    --cookie "$tmp_dir/cookies" --cookie-jar "$tmp_dir/cookies" --output "$tmp_dir/users.html" \
    "$base_url/index.php?r=userManagement/index"
csrf_token="$(grep -Eo '"csrfToken":"[^"]+"' "$tmp_dir/users.html" | sed -E 's/^"csrfToken":"([^"]+)"$/\1/' | head -n 1)"
[[ -n "$csrf_token" ]] || { echo 'LimeSurvey 用户管理页面缺少 CSRF token' >&2; exit 1; }

status="$(curl --silent --show-error --max-time 15 \
    --cookie "$tmp_dir/cookies" --output "$tmp_dir/create.html" --write-out '%{http_code}' \
    --request POST "$base_url/index.php?r=userManagement/applyEdit" \
    --data-urlencode "YII_CSRF_TOKEN=$csrf_token" \
    --data-urlencode "User[users_name]=$username" \
    --data-urlencode "User[full_name]=$username" \
    --data-urlencode "User[email]=$email" \
    --data-urlencode "User[password]=$LIMESURVEY_NEW_PASSWORD" \
    --data-urlencode "password_repeat=$LIMESURVEY_NEW_PASSWORD" \
    --data-urlencode 'preset_password=1')"
if [[ "$status" != 2* ]] || ! grep -Eiq 'success[^a-z]+true|successfully created|User successfully created' "$tmp_dir/create.html"; then
    echo "LimeSurvey 普通用户创建失败（HTTP $status）" >&2
    exit 1
fi
echo "LimeSurvey 普通用户创建成功：$username"
