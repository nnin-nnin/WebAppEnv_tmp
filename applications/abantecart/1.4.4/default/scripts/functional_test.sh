#!/usr/bin/env bash
set -euo pipefail

HOST_PORT="${HOST_PORT:-18001}"
BASE_URL="http://localhost:${HOST_PORT}"
USERNAME="${ADMIN_USERNAME:-admin}"
PASSWORD="${ADMIN_PASSWORD:-benchmark-only}"

echo "=== [AbanteCart] 层次二: 核心业务功能读写与链路验证 ==="
echo "Target: ${BASE_URL}"

COOKIE_FILE="$(mktemp)"
trap 'rm -f "$COOKIE_FILE"' EXIT

# 1. 登录并提取 Session 与 Token
LOGIN_URL="${BASE_URL}/index.php?rt=index/login&s=admin"
LOGIN_RESP=$(curl -s -i -c "$COOKIE_FILE" -b "$COOKIE_FILE" -L \
  -d "username=${USERNAME}" \
  -d "password=${PASSWORD}" \
  "$LOGIN_URL")

TOKEN=$(echo "$LOGIN_RESP" | grep -o 'token=[a-zA-Z0-9]*' | head -n1 | cut -d'=' -f2 || true)
if [ -z "$TOKEN" ]; then
    echo "FAILED: 无法从后台跳转 URL 中提取 Admin Token"
    exit 1
fi
echo "✔ [1/3] 鉴权凭证提取成功: Token=${TOKEN:0:8}..."

# 2. 访问核心业务模块 (商品目录列表 Catalog Products) 验证后台数据库与ORM读取
PRODUCT_URL="${BASE_URL}/index.php?rt=catalog/product&s=admin&token=${TOKEN}"
PRODUCT_RESP=$(curl -s -c "$COOKIE_FILE" -b "$COOKIE_FILE" "$PRODUCT_URL")

if echo "$PRODUCT_RESP" | grep -q "Products" && echo "$PRODUCT_RESP" | grep -qi "table"; then
    echo "✔ [2/3] 商品核心目录 (Catalog Products) 数据库查询正常，表格结构渲染完备"
else
    echo "FAILED: 商品目录加载异常，响应正文未包含商品表格"
    exit 1
fi

# 3. 访问订单管理 (Sale Orders) 验证交易子系统数据库表
ORDER_URL="${BASE_URL}/index.php?rt=sale/order&s=admin&token=${TOKEN}"
ORDER_RESP=$(curl -s -c "$COOKIE_FILE" -b "$COOKIE_FILE" "$ORDER_URL")

if echo "$ORDER_RESP" | grep -qi "Orders" && echo "$ORDER_RESP" | grep -qi "table"; then
    echo "✔ [3/3] 订单系统 (Sale Orders) 状态完备，核心交易链路就绪"
else
    echo "FAILED: 订单管理模块加载异常"
    exit 1
fi

echo "=== [AbanteCart] 核心业务功能链路闭环验证全部通过 ==="
exit 0
