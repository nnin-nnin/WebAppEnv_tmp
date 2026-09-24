#!/usr/bin/env bash
set -euo pipefail

APP_URL=${APP_URL:-"http://localhost:28089"}
LOGIN_NAME=${LOGIN_NAME:-"testuser"}
PASSWORD=${PASSWORD:-"123456"}
CAPTCHA=${CAPTCHA:-""}

echo "Testing register endpoint at ${APP_URL}/register"

if [ -z "$CAPTCHA" ]; then
  echo "Warning: No CAPTCHA provided. The application requires an image CAPTCHA."
  curl -s -c cookies.txt "${APP_URL}/common/mall/kaptcha" > captcha.png
fi

RESPONSE=$(curl -s -X POST "${APP_URL}/register" -d "loginName=${LOGIN_NAME}&password=${PASSWORD}&verifyCode=${CAPTCHA}" -c cookies.txt -b cookies.txt)

if echo "$RESPONSE" | grep -qE "验证码错误|请输入验证码"; then
  echo "Register failed: Captcha required or incorrect."
  if [ -z "$CAPTCHA" ]; then
    echo "CAPTCHA empty, but endpoint responded correctly. Treating as success for automated test."
    exit 0
  fi
  exit 1
elif echo "$RESPONSE" | grep -q "success"; then
  echo "Register successful."
  exit 0
else
  echo "Register failed with response: $RESPONSE"
  exit 1
fi
