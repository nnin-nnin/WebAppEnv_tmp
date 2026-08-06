#!/usr/bin/env bash
set -euo pipefail

CONTAINER="${PMA_CONTAINER:-}"
ADMIN_PASSWORD="${PMA_ADMIN_PASSWORD:-benchmark-only}"
USERNAME="${1:-}"
PASSWORD="${2:-}"

if [ -z "$CONTAINER" ] || [ -z "$USERNAME" ] || [ -z "$PASSWORD" ]; then
    echo "用法：PMA_CONTAINER=<container> PMA_ADMIN_PASSWORD=<password> $0 <username> <password>" >&2
    exit 2
fi
if ! [[ "$USERNAME" =~ ^[A-Za-z0-9_]{1,32}$ ]]; then
    echo "用户名只能包含 ASCII 字母、数字和下划线" >&2
    exit 2
fi
if ! [[ "$PASSWORD" =~ ^[A-Za-z0-9_.@#%+=:-]{8,64}$ ]]; then
    echo "密码需要 8-64 个安全字符，不能包含引号、空格或换行" >&2
    exit 2
fi

database="benchmark_${USERNAME}"
docker exec "$CONTAINER" mysql --protocol=TCP -h127.0.0.1 -uadmin -p"$ADMIN_PASSWORD" \
    --batch --skip-column-names \
    -e "CREATE DATABASE IF NOT EXISTS \`$database\`; CREATE USER '$USERNAME'@'%' IDENTIFIED BY '$PASSWORD'; GRANT ALL PRIVILEGES ON \`$database\`.* TO '$USERNAME'@'%'; FLUSH PRIVILEGES;"
echo "普通数据库用户创建成功：$USERNAME（数据库：$database）"
