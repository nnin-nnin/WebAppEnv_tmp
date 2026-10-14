#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
COMPOSE_FILE="${PROJECT_DIR}/docker/compose.yaml"
APP_URL="${APP_URL:-http://127.0.0.1:18084}"
USERNAME="${1}"
PASSWORD="${2}"

get_md5() {
    local text="$1"
    if command -v md5 >/dev/null 2>&1; then
        echo -n "${text}" | md5
    elif command -v md5sum >/dev/null 2>&1; then
        echo -n "${text}" | md5sum | awk '{print $1}'
    elif command -v python3 >/dev/null 2>&1; then
        python3 -c "import hashlib, sys; print(hashlib.md5(sys.argv[1].encode()).hexdigest())" "${text}"
    else
        echo "Error: neither md5, md5sum nor python3 available for MD5 calculation" >&2
        return 1
    fi
}

get_captcha_pair() {
    local rand_res
    rand_res=$(curl -s "${APP_URL}/jshERP-boot/user/randomImage" || echo "")
    local uuid
    uuid=$(echo "${rand_res}" | grep -o '"uuid":"[^"]*"' | cut -d':' -f2 | tr -d '"')
    
    if [ -z "${uuid}" ]; then
        echo "::"
        return 1
    fi
    
    local code=""
    if [ -f "${COMPOSE_FILE}" ]; then
        code=$(docker compose -f "${COMPOSE_FILE}" exec -T jsh-redis redis-cli -a 1234abcd get "captcha_codes:${uuid}" 2>/dev/null | tr -d '\r' | tail -n 1 || true)
    fi
    
    if [ -z "${code}" ] || [ "${code}" = "nil" ]; then
        local redis_cid
        redis_cid=$(docker ps --filter "name=jsh-redis" --format "{{.ID}}" | head -n 1)
        if [ -n "${redis_cid}" ]; then
            code=$(docker exec "${redis_cid}" redis-cli -a 1234abcd get "captcha_codes:${uuid}" 2>/dev/null | tr -d '\r' | tail -n 1 || true)
        fi
    fi
    
    echo "${uuid}:${code}"
}

verify_single_account() {
    local user="$1"
    local pass="$2"
    local role_desc="$3"
    
    local pass_md5
    pass_md5=$(get_md5 "${pass}")
    
    echo "------------------------------------------------------------"
    echo "Verifying user: [${user}] (${role_desc})"
    echo "Endpoint: ${APP_URL}/jshERP-boot/user/login"
    
    local captcha_pair
    captcha_pair=$(get_captcha_pair)
    local uuid
    uuid=$(echo "${captcha_pair}" | cut -d':' -f1)
    local code
    code=$(echo "${captcha_pair}" | cut -d':' -f2)
    
    if [ -z "${uuid}" ] || [ -z "${code}" ]; then
        echo "FAILED: Unable to retrieve captcha challenge (UUID='${uuid}', CODE='${code}')."
        return 1
    fi
    
    local payload
    payload=$(printf '{"loginName":"%s","password":"%s","code":"%s","uuid":"%s"}' "${user}" "${pass_md5}" "${code}" "${uuid}")
    
    local response
    response=$(curl -s -w "\n%{http_code}" -X POST "${APP_URL}/jshERP-boot/user/login" \
        -H "Content-Type: application/json;charset=UTF-8" \
        -d "${payload}")
    
    local http_code
    http_code=$(echo "${response}" | tail -n 1)
    local body
    body=$(echo "${response}" | sed '$d')
    
    if [ "${http_code}" != "200" ]; then
        echo "FAILED: HTTP status code ${http_code} (expected 200)"
        echo "Response body: ${body}"
        return 1
    fi
    
    if echo "${body}" | grep -q '"code":200' && echo "${body}" | grep -q 'user can login'; then
        echo "SUCCESS: User [${user}] authenticated successfully."
        
        # Extract token and verify user session API
        local token
        token=$(echo "${body}" | grep -o '"token":"[^"]*"' | cut -d':' -f2 | tr -d '"')
        if [ -n "${token}" ]; then
            local session_res
            session_res=$(curl -s -H "X-Access-Token: ${token}" "${APP_URL}/jshERP-boot/user/getUserSession")
            if echo "${session_res}" | grep -q '"code":200'; then
                echo "SUCCESS: Session token validated via /jshERP-boot/user/getUserSession."
            else
                echo "WARNING: Token obtained but session check returned non-200."
            fi
        fi
        return 0
    else
        echo "FAILED: Authentication failed for [${user}]."
        echo "Response body: ${body}"
        return 1
    fi
}

if [ -n "${USERNAME}" ] && [ -n "${PASSWORD}" ]; then
    verify_single_account "${USERNAME}" "${PASSWORD}" "Explicit CLI Credential"
    exit $?
fi

echo "============================================================"
echo "Starting multi-dimension evaluation login verification matrix"
echo "Target Base URL: ${APP_URL}"
echo "============================================================"

FAILED_COUNT=0

# 1. Administrator Level (2 accounts)
verify_single_account "admin" "AdminPassword123!" "主系统管理员 (拥有全站最高管理特权)" || FAILED_COUNT=$((FAILED_COUNT + 1))
verify_single_account "admin2" "AdminPassword123!" "次管理员 / 同级管理员 (用于测试管理员间横向越权与日志隔离)" || FAILED_COUNT=$((FAILED_COUNT + 1))

# 2. Standard User Level (2 accounts)
verify_single_account "user1" "UserPassword123!" "普通业务用户 A (拥有独立业务数据空间)" || FAILED_COUNT=$((FAILED_COUNT + 1))
verify_single_account "user2" "UserPassword123!" "普通业务用户 B (用于水平越权与 IDOR 测试)" || FAILED_COUNT=$((FAILED_COUNT + 1))

# 3. Negative Authentication Check (WrongPassword999!)
echo "------------------------------------------------------------"
echo "Verifying negative authentication rejection (WrongPassword999!)..."
if verify_single_account "admin" "WrongPassword999!" "Negative Check" >/dev/null 2>&1; then
    echo "FAILED: WrongPassword999! was falsely accepted!"
    FAILED_COUNT=$((FAILED_COUNT + 1))
else
    echo "SUCCESS: WrongPassword999! properly rejected."
fi

echo "============================================================"
if [ ${FAILED_COUNT} -eq 0 ]; then
    echo "All 4 accounts in the evaluation matrix verified successfully!"
    exit 0
else
    echo "ERROR: ${FAILED_COUNT} account(s) failed login verification."
    exit 1
fi
